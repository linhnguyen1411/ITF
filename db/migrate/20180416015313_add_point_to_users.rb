class AddPointToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :point, :integer, default: 0
  end
end
