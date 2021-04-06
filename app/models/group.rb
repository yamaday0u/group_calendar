class Group < ApplicationRecord
  # Associations
  has_many :user_groups, dependent: :destroy 
  has_many :users, through: :user_groups
  has_many :calendar_for_groups, dependent: :destroy 
  has_many :chats, dependent: :destroy 
  has_one_attached :group_image

  # Validation
  validates :name, presence: true
end
