class UsersController < ApplicationController
  before_action :skip_policy_scope

  def index
  @users = User.all
  end

  def show
  @user = User.find(params[:id])
  authorize @user
  end

  def wallet
    @user = User.find(params[:id])
    @wallet_inclusions = WalletInclusion.where(user: @user)
    authorize @user
  end
end
