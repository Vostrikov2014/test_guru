module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to("Github: TestGuru Project", "https://github.com/#{author}/#{repo}", target: :_blank)
  end

  def flash_message(flash)
    html = ''
    flash.each do |key, value|
      html << content_tag(:p, value, class: "flash #{key}")
    end
    html.html_safe
  end

end
