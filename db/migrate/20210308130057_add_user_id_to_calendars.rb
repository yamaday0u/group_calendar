class AddUserIdToCalendars < ActiveRecord::Migration[6.0]
  def change
    add_column :calendars, :user_id, :integer
  end
end
