class View < ApplicationRecord
  belongs_to :post
  belongs_to :user

  scope :by_post, -> post_id {where id: post_id}
end
