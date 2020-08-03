class TestsController < ApplicationController

  before_action :set_test, only: %i[start]

  def index
    #@tests = Test.all
    # Show tests only that have questions
    # with_questions define the 'test' in the model
    @tests = Test.with_questions
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private
  def set_test
    @test = Test.find(params[:id])
  end

end
