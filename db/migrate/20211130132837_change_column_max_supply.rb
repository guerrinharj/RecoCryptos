class ChangeColumnMaxSupply < ActiveRecord::Migration[6.0]
  def change
    change_column :cryptos, :max_supply, :float
  end
end
