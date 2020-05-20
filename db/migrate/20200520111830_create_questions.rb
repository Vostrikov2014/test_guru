class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :body
      t.integer :test_id, null: false

      t.timestamps
    end
  end
end
