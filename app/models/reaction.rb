class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :reactionable, polymorphic: true

  enum target_type: [:like, :spam]

  validates :target_type, presence: true
end
