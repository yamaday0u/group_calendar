class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :outline
      t.string :task
      t.timestamps
    end
  end
end
