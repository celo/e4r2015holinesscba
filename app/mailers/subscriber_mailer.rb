class SubscriberMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.new_subscriber_notification.subject
  #
  def new_subscriber_notification(subscriber)
    @subscriber = subscriber

    mail to: "adriana.kuniochi@gmail.com", subject: "Nova inscrição para o Encontro da 4a região"
  end
end
