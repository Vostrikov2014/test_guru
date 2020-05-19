class RemoveTestsCorrect < ActiveRecord::Migration[6.0]
  def change
    remove_column(:tests, :correct, :boolean)
  end
end
