class ChangeEndtimeToAllowNullForGroupCalendar < ActiveRecord::Migration[6.0]
  def up
    change_column :calendar_for_groups, :content, :string, null: true
    change_column :calendar_for_groups, :end_time, :datetime, null: true
  end

  def down
    change_column :calendar_for_groups, :content, :string, null: false
    change_column :calendar_for_groups, :end_time, :datetime, null: false
  end
end
