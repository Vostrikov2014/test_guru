class DropTableResults < ActiveRecord::Migration[6.0]
  def up
    drop_table :results, if_exists: true
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
