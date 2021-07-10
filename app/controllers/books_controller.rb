class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @post_comment = PostComment.new
  end

  def index
    to  = Time.current.at_end_of_day
    from  = (to - 6.day).at_beginning_of_day
    @books = Book.includes(:favorited_users).
      sort {|a,b|
        b.favorited_users.includes(:favorites).where(created_at: from...to).size <=>
        a.favorited_users.includes(:favorites).where(created_at: from...to).size
      }
    if params[:sort_update]
      @books = Book.latest
    end
    if params[:evaluation]
      @books = Book.fresh
    end
    @book = Book.new
    @user = current_user
  end

  def weekly_rank
    @books = Book.joins(:favorites).where(favorites: { created_at:　0.days.ago.prev_week..0.days.ago.prev_week(:sunday)}).group(:id).order("count(*) desc")
  end

  def edit
    @book = Book.find(params[:id])
    redirect_to books_path unless current_user.id == @book.user_id
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to book_path(@book.id)
    else
       render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :category , :evaluation)
  end

end
