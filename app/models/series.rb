class Series < ApplicationRecord
  has_many :posts, -> { where type: :article }, dependent: :destroy, inverse_of: :series
  belongs_to :user
end
