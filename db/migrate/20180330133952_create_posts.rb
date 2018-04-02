class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.datetime :deleted_at, index: true
      t.integer :type
      t.references :user, index: true, foreign_key: true
      t.references :series, index: true, foreign_key: true, default: nil

      t.timestamps
    end
  end
end
