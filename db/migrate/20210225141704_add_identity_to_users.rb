class AddIdentityToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :identity, :text
  end
end
