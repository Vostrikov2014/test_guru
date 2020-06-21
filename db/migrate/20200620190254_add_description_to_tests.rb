class AddDescriptionToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :description, :text
  end
end
