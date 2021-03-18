class DropChatTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :chats
  end

  def down
    
  end
end
