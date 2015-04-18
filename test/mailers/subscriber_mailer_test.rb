require 'test_helper'

class SubscriberMailerTest < ActionMailer::TestCase
  test "new_subscriber_notification" do
    mail = SubscriberMailer.new_subscriber_notification
    assert_equal "New subscriber notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
