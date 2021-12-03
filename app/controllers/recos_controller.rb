class RecosController < ApplicationController
  def create
    @reco = Reco.new
    authorize @reco
    @crypto = Crypto.find(params[:crypto_id])
    @comment = Comment.find(params[:comment_id])
    @reco.crypto = @crypto
    @reco.user = current_user
    @reco.comment = @comment
    @user = @comment.user
    @user.recos += 1
    @reco.save!
    @user.save!
    redirect_to crypto_path(@crypto)
  end

  def destroy
    @reco = Reco.find(params[:id])
    authorize @reco
    @crypto = Crypto.find(@reco.crypto_id)
    @user = @reco.user
    @user.recos -= 1
    @user.save!
    @reco.destroy
    redirect_to crypto_path(@crypto)
  end
end
