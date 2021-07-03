class SearchController < ApplicationController

 def search
   @range = params[:range]
   search = params[:search]
   word = params[:word]
　 @users = User.looks(search, word)
 end

 def search
   @word = params[:word]
   @range = params[:range]
  if @range == "User"
    @users = User.looks(params[:search], params[:word])
  else
    @books = Book.looks(params[:search], params[:word])
  end
 end
end