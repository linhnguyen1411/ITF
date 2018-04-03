class Post < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :user
  belongs_to :series, optional: true
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  enum type: {article: 0, question: 1}

  validates :title, presence: true, length: {maximum: Settings.post.max_title,
    minimum: Settings.post.min_title}
  validates :content, presence: true
end
