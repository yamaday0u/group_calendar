class CreateGroupCalendarChats < ActiveRecord::Migration[6.0]
  def change
    create_table :group_calendar_chats do |t|
      t.string :text, null: false
      t.references :user, foreign_key: true
      t.references :calendar_for_group, foreign_key: true
      t.timestamps
    end
  end
end
