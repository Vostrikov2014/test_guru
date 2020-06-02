class User < ApplicationRecord

  has_many :results
  has_many :tests, through: :results
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id

  def user_results(level)
    #Test.joins(results: :user).where(level: level)
    tests.where(level: level)
  end
end