class CryptosController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def api_get
    ApiJob.perform_later
  end

  def index
    skip_policy_scope

    if params[:query].present?
      @cryptos = Crypto.search_by_name(params[:query])
    elsif params[:sort].present?
      @cryptos = Crypto.all.order(params[:sort] + " " + params[:direction])
    else
      @cryptos = Crypto.all.order("price DESC")
    end

    api_get
  end

  def show
    @crypto = Crypto.find(params[:id])
    authorize @crypto

    @found_like = Like.where(crypto_id: @crypto.id, user_id: current_user)
    @like = Like.new

    @comments = Comment.where(crypto_id: @crypto)
    @comment = Comment.new

    @reco = Reco.new
  end
end
