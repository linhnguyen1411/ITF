class Follow < ApplicationRecord
  belongs_to :followable, polymorphic: true
  belongs_to :user
  acts_as_paranoid
end
