class CreateUserCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :user_calendars do |t|

      t.timestamps
    end
  end
end
