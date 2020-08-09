class BadgesGive

  attr_accessor :given

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
  end

  def call
    Badge.all.each do |badge|
      given_user(badge) if self.send("#{badge.rule}?", badge.value)
    end
  end

  private

  def all_tests_category?(category)
    @test_passage.test.category_id == category && @test_passage.success? && @user.tests.where("category = ?", category).uniq.count == Test.where("category = ?", category).count
  end

  def first_try?(title)
    @test_passage.test.title == title && @test_passage.success? && @user.tests.where("title = ?", @test_passage.test.title).count == 1
  end

  def certain_level?(level)
    @test_passage.test.level == level && @test_passage.success? && @user.tests.where("level = ?", level).uniq.count == Test.where("level = ?", level).count
  end

  def given_user(badge)
    @user.badges << badge
    @given = true
  end
end
