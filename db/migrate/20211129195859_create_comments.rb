class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :votes
      t.boolean :is_edited
      t.datetime :date
      t.references :user, foreign_key: true
      t.references :crypto, foreign_key: true
      t.timestamps
    end
  end
end
