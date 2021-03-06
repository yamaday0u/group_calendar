class Calendar < ApplicationRecord
  has_many :user_calendars, dependent: :destroy
  has_many :users, through: :user_calendars
end
