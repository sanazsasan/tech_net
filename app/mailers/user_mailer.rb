class UserMailer < ActionMailer::Base
  default from: "mhedayati1357@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(member)
    @member = member
    mail :to => member.email, :subject => "Password Reset"
  end
end
