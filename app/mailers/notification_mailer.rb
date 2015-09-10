class NotificationMailer < ApplicationMailer

	def email_new_adoption_request( user, gem_for_adoption, adoption_request)
		@gem_owner = gem_for_adoption.user
		@user = user
		@gem = gem_for_adoption
    @adoption_request = adoption_request
		mail(to: @gem_owner.email, subject: 'RubyGems Adoption Center - New adoption request')
	end
end
