class Test < ApplicationRecord

  belongs_to :category
  scope :sort_category, ->(category) { joins(:category).where(categories: { title: category }) }

  def self.sort_by_category(category_name)
    sort_category(category_name).order(title: :desc).pluck(:title)
  end
end
