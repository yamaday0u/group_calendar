class CreateMateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :mate_chats do |t|
      t.string :text, null: false
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
