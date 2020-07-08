class RemoveNameFromUsers < ActiveRecord::Migration[6.0]

  def up
    remove_column :users, :name, :string
  end

  def down
    add_column :users, :name, :string
  end
end
