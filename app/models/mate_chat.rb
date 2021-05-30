class MateChat < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :room

  # Validation
  validates :text, presence: true
end
