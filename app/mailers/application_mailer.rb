class ApplicationMailer < ActionMailer::Base
  default from: ENV["default-from-email"]
  layout 'mailer'
end
