class Group < ApplicationRecord
  # Associations
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :calendar_for_groups
  has_many :chats
  has_one_attached :group_image

  # Validation
  validates :name, presence: true
end
