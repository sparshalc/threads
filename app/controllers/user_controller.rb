class UserController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end
  def index
    @user = User.all
  end
end
