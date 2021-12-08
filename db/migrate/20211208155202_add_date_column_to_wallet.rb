class AddDateColumnToWallet < ActiveRecord::Migration[6.0]
  def change
    add_column :wallet_inclusions, :date_wallet, :datetime
  end
end
