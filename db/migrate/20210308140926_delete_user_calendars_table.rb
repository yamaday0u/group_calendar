class DeleteUserCalendarsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :user_calendars
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
