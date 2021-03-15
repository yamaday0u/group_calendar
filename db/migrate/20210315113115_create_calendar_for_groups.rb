class CreateCalendarForGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :calendar_for_groups do |t|

      t.timestamps
    end
  end
end
