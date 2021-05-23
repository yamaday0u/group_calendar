class Room < ApplicationRecord
  # Associations
  has_many :room_users
  has_many :users, through: :room_users
  has_many :mate_chats
end
