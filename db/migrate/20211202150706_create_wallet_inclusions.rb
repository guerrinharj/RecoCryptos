class CreateWalletInclusions < ActiveRecord::Migration[6.0]
  def change
    create_table :wallet_inclusions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :crypto, null: false, foreign_key: true
      t.integer :buying_price
      t.integer :amount

      t.timestamps
    end
  end
end
