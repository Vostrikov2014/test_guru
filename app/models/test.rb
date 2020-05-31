class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  has_many :results
  has_many :users, through: :results

  def self.sort_by_category(name)
    joins(:category).where(categories: { title: name }).order(title: :desc)
  end
end
