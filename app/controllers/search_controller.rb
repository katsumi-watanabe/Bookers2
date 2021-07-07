class SearchController < ApplicationController

def search
  @book = Book.new
  @books = Book.all
  @user = current_user
  @word = params[:word]
  @books = Book.looks(params[:search], params[:word])
end
end