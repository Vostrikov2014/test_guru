class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  has_many :results
  has_many :users, through: :results
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, uniqueness: true

  scope :easy, -> { where(level: 0..1).order(created_at: :desc) }
  scope :normal, -> { where(level: 2..4).order(created_at: :desc) }
  scope :hard, -> { where(level: 5..Float::INFINITY).order(created_at: :desc) }

  scope :category_sort, -> (name) { joins(:category).where(categories: { title: name }).order(title: :desc) }
  def self.sort_by_category(name)
    #joins(:category).where(categories: { title: name }).order(title: :desc)  #lesson_5
    category_sort(name)
  end
end
