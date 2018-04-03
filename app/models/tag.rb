class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags

  validates :name, presence: true, length: {maximum: Settings.tag.max_name,
    minimum: Settings.tag.min_name}

  scope :order_by_used_count, -> do
    left_joins(:post_tags).group("tags.id").order("count(post_tags.id) desc")
  end
end
