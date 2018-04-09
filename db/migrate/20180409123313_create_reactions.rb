class CreateReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|
      t.integer :target_type
      t.datetime :deleted_at, index: true
      t.references :user, index: true, foreign_key: true
      t.references :reactionable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
