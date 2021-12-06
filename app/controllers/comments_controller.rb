class CommentsController < ApplicationController
  def create
    @crypto = Crypto.find(params[:crypto_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.crypto_id = @crypto.id
    authorize @comment
    if @comment.save
      redirect_to crypto_path(@crypto, anchor: "#{@comment.id}")
    else
      flash[:notice]
    end
  end

  def update

  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @crypto = @comment.crypto
    @comment.destroy
    redirect_to crypto_path(@crypto)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
