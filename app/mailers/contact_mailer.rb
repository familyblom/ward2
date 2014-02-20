class ContactMailer < ActionMailer::Base

  layout "email_template"
  def contact_me(message)
    @message = ContactMessage.find(message)
    mail to: "me@beneggett.com", subject: " #{@message.name} | #{@message.topic}", from: @message.email
  end
end
