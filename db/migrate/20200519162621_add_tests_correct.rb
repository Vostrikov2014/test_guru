class AddTestsCorrect < ActiveRecord::Migration[6.0]
  def change
    add_column(:tests, :correct, :boolean)
  end
end
