class DeleteUserCalendarsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_calendars
  end
end
