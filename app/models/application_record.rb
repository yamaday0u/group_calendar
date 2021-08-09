class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # is used in models/calendar.rb & calendar_for_group.rb
  def start_end_check
    if start_time.present?
      if start_time > end_time
        errors.add(:end_time, 'must set be late than Start time')
      end
    end
  end
end
