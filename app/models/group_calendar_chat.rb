class GroupCalendarChat < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :group
end
