class CalendarForGroup < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :group
  has_many :group_calendar_chats
  has_many :users, through: :group_calendar_chats

  # Validation
  with_options presence: true do
    validates :title
    validates :start_time
  end
  validate :start_end_check # custom method from models/application_record.rb
end
