class WalletInclusionsController < ApplicationController

  def create
    @wallet_inclusion = WalletInclusion.new(wallet_inclusions_params)
    authorize @wallet_inclusion
    @wallet_inclusion.user = current_user
    if @wallet_inclusion.save
      redirect_to wallet_user_path(current_user)
    end
  end

  private

  def wallet_inclusions_params
    params.require(:wallet_inclusion).permit(:amount, :crypto_id, :buying_price)
  end
end
