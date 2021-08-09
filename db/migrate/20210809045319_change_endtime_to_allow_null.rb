class ChangeEndtimeToAllowNull < ActiveRecord::Migration[6.0]
  def up
    change_column :calendars, :content, :string, null: true
    change_column :calendars, :end_time, :datetime, null: true
  end

  def down
    change_column :calendars, :content, :string, null: false
    change_column :calendars, :end_time, :datetime, null: false
  end
end
