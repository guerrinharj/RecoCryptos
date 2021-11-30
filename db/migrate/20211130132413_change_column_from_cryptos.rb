class ChangeColumnFromCryptos < ActiveRecord::Migration[6.0]
  def change
    change_column :cryptos, :circulating_supply, :float
    change_column :cryptos, :total_supply, :float
  end
end
