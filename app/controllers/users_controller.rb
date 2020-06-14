class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  	@users = User.all
    @user = current_user
  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books.page(params[:page]).reverse_order
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  private

  def user_params
  params.requir(:user).permit(:name, :introduction :profile_image)
  end

end
