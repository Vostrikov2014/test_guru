class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
    #@client = client || Octokit::Client.new(access_token: 'd07b633b4a0141b47a30b6a48a4897dc0fde10dc')
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 200 || 201
  end

  private

  def gist_params
    {
        description: I18n.t('.description', title: @test.title),
        files: {
            'test-guru-question.txt' => {
                content: gist_content
            }
        }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
