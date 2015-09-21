class NotificationMailer < ApplicationMailer

  def email_new_adoption_request(user, gem_for_adoption)
    @gem_owner = gem_for_adoption.users.first
    @user = user
    @gem = gem_for_adoption
    mail(to: @gem_owner.email, from: 'me@example.com', subject: 'RubyGems Adoption Center - New adoption request')
  end

  def email_adoption_request_accepted(user, gem_for_adoption)
    @user = User.find(user)
    @gem = gem_for_adoption
    mail(to: @user.email, from: 'me@example.com', subject: 'RubyGems Adoption Center - Adoption Request Accepted')
  end

  def email_adoption_request_rejected(user, gem_adoption)
    @user = User.find(user)
    @gem_adoption = gem_adoption
    users_rejected = AdoptionRequest.where(gems_adoption_id: @gem_adoption).where.not(user_id: @user)
    users_rejected.each do |user_rejected|
      mail(to: user_rejected.user.email, from: 'me@example.com', subject: 'RubyGems Adoption Center - Adoption Request Rejected')
    end
  end
end
