class CalendarForGroup < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :group
  has_many :group_calendar_chats
  has_many :users, through: :group_calendar_chats

  # Validation
  validates :title, presence: true
  validate :start_end_check # custom method from models/application_record.rb
end
