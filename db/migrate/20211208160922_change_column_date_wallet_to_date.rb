class ChangeColumnDateWalletToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :wallet_inclusions, :date_wallet, :date
  end
end
