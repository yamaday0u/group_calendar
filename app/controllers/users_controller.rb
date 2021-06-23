class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @mates = current_user.matchers
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @relationship = Relationship.new
  end
end
