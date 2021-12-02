class CommentsController < ApplicationController

  def create
    @crypto = Crypto.find(params[:crypto_id])
    @comment = Comment.new(comment_params)
    @comment.save
    raise
    redirect_to crypto_path(@crypto)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
