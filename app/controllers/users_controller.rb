class UsersController < ApplicationController
  def index
    @mates = current_user.matchers
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @relationship = Relationship.new
  end
end
