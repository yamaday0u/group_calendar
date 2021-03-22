class Calendar < ApplicationRecord
  # Associations
  belongs_to :user

  # Validation
  validates :title, presence: true
end
