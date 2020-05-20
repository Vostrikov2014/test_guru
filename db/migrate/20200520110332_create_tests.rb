class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0
      t.integer :category_id, null: false

      t.timestamps
    end

    add_index :tests, :category_id
  end
end
