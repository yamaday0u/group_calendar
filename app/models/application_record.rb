class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def start_end_check # is used in models/calendar.rb & calendar_for_group.rb
    errors.add(:end_time, "must set be late than Start time") if self.start_time > self.end_time
  end
end
