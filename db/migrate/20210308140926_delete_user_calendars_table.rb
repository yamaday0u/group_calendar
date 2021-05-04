class DeleteUserCalendarsTable < ActiveRecord::Migration[6.0]
  def down
    drop_table :user_calendars
  end

  def up; end
end
