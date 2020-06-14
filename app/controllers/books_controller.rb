class BooksController < ApplicationController
  def index
  	@book = Book.new
  	@books = Book.all
  	@user = User.find(current_user.id)
  	@users =User.all
  end

  def show
  	@book = Book.find(params[:id])
  	@user = User.find(@book.user_id)
  	@book_new = Book.new
  end

  def new
  	@book = Book.new
  end

  def create
  	@user = User.find(current_user.id)
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	@book.save
  	redirect_to books_path
  end

  def edit
  	@user = current_user
  	@user = User.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	@book.update(book_params)
  	redirect_to book_path(@book.id)
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
