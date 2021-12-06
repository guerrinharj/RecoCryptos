class WalletInclusionsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @wallet_inclusion = WalletInclusion.new(wallet_inclusions_params)
    authorize @wallet_inclusion
    @wallet_inclusion.user = @user
    if @wallet_inclusion.save
      redirect_to wallet_user_path(@user)
    end
  end

  def destroy
    @user = current_user
    @wallet_inclusion = WalletInclusion.find(params[:id])
    authorize @wallet_inclusion
    if @wallet_inclusion.destroy
      redirect_to wallet_user_path(@user)
    end
  end

  private

  def wallet_inclusions_params
    params.require(:wallet_inclusion).permit(:amount, :crypto_id, :buying_price)
  end
end
