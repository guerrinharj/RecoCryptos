class AddColumnRecosToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :recos, :integer
  end
end
