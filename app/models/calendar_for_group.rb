class CalendarForGroup < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :group

  # Validation
  validates :title, presence: true
  validate :start_end_check # custom method from models/application_record.rb
end
