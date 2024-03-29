class Calendar < ApplicationRecord
  # Associations
  belongs_to :user

  # Validation
  validates :title, presence: true
  validates :start_time, presence: true
  validate :start_end_check # custom method from models/application_record.rb
end
