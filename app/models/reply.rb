class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent_reply, class_name: Reply.name, foreign_key: :parent_id, optional: true
  has_many :children_replies, class_name: Reply.name, foreign_key: :parent_id,
    dependent: :destroy, inverse_of: :parent_reply

  validates :content, presence: true

  scope :by_post, -> post_id do
    where(post_id: post_id, parent_id: nil).merge(include_user)
    .merge(include_children_replies)
  end

  private

  scope :include_user, -> {includes(:user)}
  scope :include_children_replies, -> {includes(children_replies: :user)}
end
