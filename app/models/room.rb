class Room < ApplicationRecord
  # Associations
  has_many :room_users
  has_many :users, through: :room_users
  has_many :mate_chats
 
  belongs_to :talker_1, class_name: "User"
  belongs_to :talker_2, class_name: "User"

end
