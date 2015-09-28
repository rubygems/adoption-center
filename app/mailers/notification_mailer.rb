class NotificationMailer < ApplicationMailer

  def email_new_adoption_request(user, gem_for_adoption)
    @gem_owner = gem_for_adoption.users.first
    @user = user
    @gem = gem_for_adoption
    mail(to: @gem_owner.email, subject: 'RubyGems Adoption Center - New adoption request')
  end

  def email_adoption_request_status(user, ruby_gem, status)
    @user = user
    @ruby_gem = ruby_gem
    @status = status
    mail(to: @user.email, subject: 'RubyGems Adoption Center - Adoption Request ' + @status)
  end
end
