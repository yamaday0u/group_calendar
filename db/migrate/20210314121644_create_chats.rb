class CreateChats < ActiveRecord::Migration[6.0]
  def up
    create_table :chats do |t|
      t.string :text, null: false
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end

  def down
    
  end
end

