class Series < ApplicationRecord
  has_many :posts, -> { where type: :article }, dependent: :destroy, inverse_of: :series
  belongs_to :user
  has_many :reactions, as: :reactionable, dependent: :destroy

  scope :includes_full, -> do
    merge(include_posts).merge(include_views_count)
  end

  private

  scope :include_posts, -> {includes posts: :views}
  scope :include_views_count, -> do
    left_joins(:posts).group("series.id").select("series.*, sum(posts.view) as views_count")
  end
end
