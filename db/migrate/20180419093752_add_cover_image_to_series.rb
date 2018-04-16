class AddCoverImageToSeries < ActiveRecord::Migration[5.1]
  def change
    add_column :series, :cover_image, :string
  end
end
