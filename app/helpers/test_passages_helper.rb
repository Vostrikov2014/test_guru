module TestPassagesHelper
  def test_result(test_passage)
    if test_passage.success?
      "<p class=\"result--passed\">Test Passed! Your result: #{test_passage.percents}%</p>".html_safe
    else
      "<p class=\"result--not_passed\">Test Failed! Your result: #{test_passage.percents}%</p>".html_safe
    end
  end
end
