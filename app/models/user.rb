class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :tests_author, class_name: 'Test', foreign_key: :author_id

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def user_results(level)
    #Test.joins(results: :user).where(level: level)
    tests.where(level: level)
  end
end