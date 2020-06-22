class TestsController < ApplicationController
  #protect_from_forgery with: :exception
  before_action :test_find, only: [:show, :edit, :destroy]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    @test = Test.find(params[:id])

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    render plain: 'Start certain test'
  end


  private

  def test_find
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id, :description)
  end
end





#render plain: 'All tests'

#render html: '<h1>All tests</h1>'.html_safe

#render json: { tests: [] }

#render json: { tests: Test.all }

#render inline: '<p>My favourite language is: <%= %[ybuR].reverse! %>!</p>'

#render file: 'public/hello', layout: false

#head 204

#head :no_content

#byebug

#logger.info(self.object_id)

#respond_to do |format|
#  format.html { render plain: 'All tests'}
#  format.json { render json: { tests: Test.All} }
#end
