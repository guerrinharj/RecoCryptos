class CreateRecos < ActiveRecord::Migration[6.0]
  def change
    create_table :recos do |t|
      t.references :user, foreign_key: true
      t.references :crypto, foreign_key: true
      t.references :comment, foreign_key: true
      t.timestamps
    end
  end
end
