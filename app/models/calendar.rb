class Calendar < ApplicationRecord

  # Associations
  belongs_to :users, optional: true

  # Validation
  validates :title, presence: true
end
