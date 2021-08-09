class AddTokensToUsers < ActiveRecord::Migration[6.0]
  def up
    
    add_column :users, :uid, :string, null: false, default: ''
    add_column :users, :tokens, :text
    User.reset_column_information
    User.find_each do |user|
      user.uid = user.email
      user.provider = 'email'
      user.save!
    end
    add_index :users, %i[uid provider], unique: true
  end

  def down
    remove_columns :users, :provider, :uid, :tokens
  end
end
