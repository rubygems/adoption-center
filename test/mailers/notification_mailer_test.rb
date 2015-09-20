require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase

  test "new adoption request " do
    email = NotificationMailer.email_new_adoption_request(users(:alfonso), ruby_gems(:pg)).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['angela4713@gmail.com'], email.to
    assert_equal 'RubyGems Adoption Center - New adoption request', email.subject
  end
end
