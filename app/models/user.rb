class User < ApplicationRecord

  has_many :results
  has_many :tests, through: :results

  def user_results(level)
    Test.joins(results: :user).where(level: level)
    #tests.where(level: level)
  end
end