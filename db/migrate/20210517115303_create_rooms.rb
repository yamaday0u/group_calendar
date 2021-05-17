class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :talker_1, null: false, foreign_key: { to_table: :users}
      t.references :talker_2, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
