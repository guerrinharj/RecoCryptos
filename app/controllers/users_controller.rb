class UsersController < ApplicationController
  before_action :skip_policy_scope

  def sum(number)
    number + 1
  end

  def index
    @users = User.all.order('recos DESC')
    user_length = User.count
    @positions = (1..user_length)
  end

  def show
  @user = User.find(params[:id])
  authorize @user
  end
end
