class Room < ApplicationRecord
  belongs_to :talker_1, class_name: "User"
  belongs_to :talker_2, class_name: "User"
end
