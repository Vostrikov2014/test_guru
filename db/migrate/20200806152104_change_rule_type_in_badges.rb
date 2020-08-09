class ChangeRuleTypeInBadges < ActiveRecord::Migration[6.0]
  def change
    change_column :badges, :rule, :string
  end
end
