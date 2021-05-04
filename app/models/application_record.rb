class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # is used in models/calendar.rb & calendar_for_group.rb
  def start_end_check
    errors.add(:end_time, 'must set be late than Start time') if start_time > end_time
  end
end
