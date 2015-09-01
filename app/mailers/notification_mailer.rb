class NotificationMailer < ApplicationMailer

	def email_new_adoption_request(gem_owner , user, gem_for_adoption)
		@gem_owner = gem_owner
		@user = user
		@gem = gem_for_adoption
		mail(to: @user.email, subject: 'RubyGems Adoption Center - New adoption request')
	end
end
