class UserMailer < ActionMailer::Base
  default from: "noreply@my_site.com"

  layout "email_template"
  
  def welcome(user)
    @user = User.find(user)
    mail(to: @user.email, subject: "Hey #{ @user.first_name }, Welcome to My Awesome Site")
  end

end
