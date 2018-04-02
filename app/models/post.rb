class Post < ApplicationRecord
  belongs_to :user
  belongs_to :series, optional: true
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  enum type: {article: 0, question: 1}
end
