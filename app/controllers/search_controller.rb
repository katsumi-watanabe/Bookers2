class SearchController < ApplicationController
 def search
  @books = Book.all
  @users = User.all
 end

 def search
   @range = params[:range]
   search = params[:search]
   word = params[:word]
　 @users = User.looks(search, word)
 end

 def search
   @range = params[:range]
  if @range == "User"
    @users = User.looks(params[:search], params[:word])
  else
    @books = Book.looks(params[:search], params[:word])
  end
 end
end