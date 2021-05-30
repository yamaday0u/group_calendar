class CreateGroupCalendarChats < ActiveRecord::Migration[6.0]
  def change
    create_table :group_calendar_chats do |t|

      t.timestamps
    end
  end
end
