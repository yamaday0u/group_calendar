class CreateCalendarForGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :calendar_for_groups do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end
