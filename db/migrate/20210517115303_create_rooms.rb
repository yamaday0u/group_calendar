class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :talker_1, null: false, foreign_key: true
      t.references :talker_2, null: false, foreign_key: true

      t.timestamps
    end
  end
end
