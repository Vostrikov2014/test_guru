class User < ApplicationRecord

  def user_tests_list(level)
    self.tests.where(level: level)
  end
end
