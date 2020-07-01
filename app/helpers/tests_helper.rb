module TestsHelper

  TEST_LEVELS = {0 => :легкий, 1 => :средний, 2 => :продвинутый, 3 => :сложный }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :суперсложный
  end
end
