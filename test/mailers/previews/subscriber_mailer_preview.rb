# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/subscriber_mailer/new_subscriber_notification
  def new_subscriber_notification
  	subscriber = Subscriber.first
    SubscriberMailer.new_subscriber_notification(subscriber)
  end

end
