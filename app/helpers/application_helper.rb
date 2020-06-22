module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to("Github: Учебное web-приложение - создание, редактирование и прохождение тестов", "https://github.com/#{author}/#{repo}", target: :_blank)
  end
end
