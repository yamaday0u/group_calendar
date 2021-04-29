class DeleteUserCalendarsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :user_calendars
  end

  def down
  end
end
