class CreateCryptos < ActiveRecord::Migration[6.0]
  def change
    create_table :cryptos do |t|
      t.string :name
      t.string :symbol
      t.integer :vote
      t.integer :max_supply
      t.integer :circulating_supply
      t.integer :total_supply
      t.float :price
      t.float :volume_24h
      t.float :volume_change_24h
      t.float :percent_change_1h
      t.float :percent_change_24h
      t.float :percent_change_7d
      t.float :percent_change_30d
      t.float :market_cap
      t.float :market_cap_dominance
      t.timestamps
    end
  end
end
