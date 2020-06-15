class TestsController < ApplicationController
  #protect_from_forgery with: :exception

  def index

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
  end

  def show
    redirect_to root_path
  end

  def start
    render plain: 'Start certain test'
  end
end
