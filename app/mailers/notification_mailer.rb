class NotificationMailer < ApplicationMailer

  def email_new_adoption_request(user, gem_for_adoption)
    @gem_owner = gem_for_adoption.users.first
    @user = user
    @gem = gem_for_adoption
    mail(to: @gem_owner.email, from: 'me@example.com', subject: 'RubyGems Adoption Center - New adoption request')
  end
end
