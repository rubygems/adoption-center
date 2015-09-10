require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase

  test "new adoption request " do
    email = NotificationMailer.email_new_adoption_request(users(:alfonso), gems_adoptions(:pg), adoption_requests(:one)).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['me@example.com'], email.from
    assert_equal ['ammancilla@gmail.com'], email.to
    assert_equal 'RubyGems Adoption Center - New adoption request', email.subject
 
	end
end
