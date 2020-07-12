class ApplicationMailer < ActionMailer::Base
  default from: %{"Test guru" <mail@example.com>}
  layout 'mailer'
end
