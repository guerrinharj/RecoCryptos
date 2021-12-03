class LikesController < ApplicationController
  def create
    @crypto = Crypto.find(params[:crypto_id])
    @like = Like.new
    authorize @like
    @like.crypto_id = @crypto.id
    @like.user = current_user
    @like.save
    redirect_to crypto_path(@crypto)
  end

  def destroy
    @like = Like.find(params[:id])
    authorize @like

    @query_likes = Like.where(crypto_id: @like.crypto_id, user_id: current_user)

    @query_likes.destroy_all

    redirect_to crypto_path(@like.crypto_id)
  end
end
