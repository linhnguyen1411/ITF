class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags

  validates :name, presence: true, length: {maximum: Settings.tag.max_name,
    minimum: Settings.tag.min_name}

  scope :order_by, -> {left_joins(:post_tags).group "tags.id" }do
    def posts_count
      order "count(post_tags.id) desc"
    end
    def include_posts_count
      select "tags.*, count(post_tags.post_id) as posts_count"
    end
  end
end
