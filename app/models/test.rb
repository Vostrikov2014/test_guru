class Test < ApplicationRecord

  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: :author_id, optional: true

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1).order(created_at: :desc) }
  scope :normal, -> { where(level: 2..4).order(created_at: :desc) }
  scope :hard, -> { where(level: 5..Float::INFINITY).order(created_at: :desc) }

  scope :category_sort, -> (name) { joins(:category).where(categories: { title: name }) }
  def self.sort_by_category(name)
    category_sort(name).order(title: :desc).pluck(:title)
  end
end
