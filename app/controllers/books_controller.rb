class BooksController < ApplicationController


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to books_path
    else
     redirect_to root_path
   end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
