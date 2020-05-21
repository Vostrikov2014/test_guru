class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.text :body
      t.boolean :correct, default: false
      t.references :questions, foreign_key: true

      t.timestamps
    end
  end
end
