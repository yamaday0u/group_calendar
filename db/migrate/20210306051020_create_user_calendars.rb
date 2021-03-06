class CreateUserCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :user_calendars do |t|
      t.references :user, foreign_key: true
      t.references :calendar, foreign_key: true
      t.timestamps
    end
  end
end
