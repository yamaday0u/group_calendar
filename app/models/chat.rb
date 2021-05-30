class Chat < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :group

  # Validation
  validates :text, presence: true
end
