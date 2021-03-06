class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def gist
    connection = GistQuestionService.new(@test_passage.current_question)
    result = connection.call

    if connection.success?
      current_user.gists.create(question_id: @test_passage.current_question_id, url: result.html_url)
      flash[:notice] = t('.success', gist_url: view_context.link_to('Gist', result.html_url, target:'_blank')).html_safe
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  def update
    if @test_passage.time_over?
      flash[:timer] = t('.timeover')
      redirect_to result_test_passage_path(@test_passage)
    else
      @test_passage.accept!(params[:answer_ids])
      if @test_passage.completed?
        badge = BadgesGive.new(@test_passage)
        badge.call
        flash[:notice] = t('.awarded', badge_url: view_context.link_to('badge', badges_path, target: '_blank')).html_safe if badge.given

        TestsMailer.completed_test(@test_passage).deliver_now
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
