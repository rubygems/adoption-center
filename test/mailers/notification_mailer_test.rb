require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase

  test "new adoption request " do
    email = NotificationMailer.email_new_adoption_request(users(:alfonso), ruby_gems(:pg)).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['angela4713@gmail.com'], email.to
    assert_equal 'RubyGems Adoption Center - New adoption request', email.subject
  end

  test "adoption request accepted" do
    email = NotificationMailer.email_adoption_request_status(users(:alfonso), ruby_gems(:pg), "Accepted").deliver_now
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['ammancilla@gmail.com'], email.to
    assert_equal 'RubyGems Adoption Center - Adoption Request Accepted', email.subject
  end

  test "adoption request rejected" do
    email = NotificationMailer.email_adoption_request_status(users(:sebastian), ruby_gems(:pg), "Rejected").deliver_now
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['sebasoga@gmail.com'], email.to
    assert_equal 'RubyGems Adoption Center - Adoption Request Rejected', email.subject
  end
end
