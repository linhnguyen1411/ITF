class Series < ApplicationRecord
  has_many :posts, -> { where type: :article }, dependent: :destroy
end
