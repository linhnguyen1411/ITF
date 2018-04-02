class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags

  scope :order_by_used_count, -> do
    joins(:post_tags).group("tags.id").order("count(tags.id) desc")
  end
end
