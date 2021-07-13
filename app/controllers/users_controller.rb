class UsersController < ApplicationController

  def show
    @book = Book.new
    @books = Book.all
    @user = User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def search
    @user = User.find(params[:user_id])
    @books = Book.all
    @book = Book.new
    if params[:created_at] == ""
      @search_book = "日付を入力してください"
    else
      create_at = params[:created_at]
      @search_book = @books.where(["created_at LIKE ?", "#{create_at}%"]).count
    end
  end

  def create
    @user = User.find(params[:id])
  end

  def index
    @user = User.new
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless current_user.id == @user.id
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
