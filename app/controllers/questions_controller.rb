class QuestionsController < ApplicationController

  before_action :test_find, only: [:index, :new, :create]
  before_action :question_find, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
    render inline: "<h2>Вопросы теста: <%= @test.title %></h2><% @questions.each do |q| %><p><%= q.body %></p><%end%>"
  end

  def show
    render inline: "<p><%= @question.body %></p>"
  end

  def new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_questions_path
    else
      render inline: "<p><%= @question.errors.full_messages %></p>"
    end

  end

  def destroy
    @question.destroy
    redirect_to test_questions_path
  end

  private

  def test_find
    @test = Test.find(params[:test_id])
  end

  def question_find
    @question = Question.find[:id]
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден!'
  end
end
