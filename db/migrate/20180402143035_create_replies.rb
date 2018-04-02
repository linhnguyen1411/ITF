class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.text :content
      t.datetime :deleted_at, index: true
      t.boolean :correct_answer, default: false
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.integer :parent_id

      t.timestamps
    end
  end
end
