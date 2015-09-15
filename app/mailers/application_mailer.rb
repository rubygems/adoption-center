class ApplicationMailer < ActionMailer::Base
  default from: ENV["email"]
  layout 'mailer'
end
