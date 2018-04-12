class AddCoverImageToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :cover_image, :string
  end
end
