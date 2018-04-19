class CreateSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :series do |t|
      t.string :title
      t.text :content
      t.datetime :deleted_at, index: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
