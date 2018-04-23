class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags
  has_many :passive_follows, class_name: Follow.name, as: :followable, dependent: :destroy
  has_many :followers, through: :passive_follows, source: :user
  validates :name, presence: true, length: {maximum: Settings.tag.max_name,
    minimum: Settings.tag.min_name}

  acts_as_paranoid

  scope :order_by, -> {left_joins(:post_tags).group "tags.id" }do
    def posts_count
      order "count(post_tags.id) desc"
    end
    def include_posts_count
      select "tags.*, count(post_tags.post_id) as posts_count"
    end
  end
end
