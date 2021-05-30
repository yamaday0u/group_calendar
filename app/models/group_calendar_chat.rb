class GroupCalendarChat < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :calendar_for_group
end
