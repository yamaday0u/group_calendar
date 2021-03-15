class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :calendar_for_groups
  has_many :chats
  
  validates :name, presence: true
end
