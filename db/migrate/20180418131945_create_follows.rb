class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.datetime :deleted_at
      t.references :user, index: true, foreign_key: true
      t.references :followable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
