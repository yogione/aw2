class UserMailer < ActionMailer::Base
  default :from => "from@example.com"


  def password_notification(user, url)
    @user = user
    @url = url
    mail(:to => user.email,
         :subject => "Password reset url", :from => 'Administartor@autoworkers.com')
  end

  def new_account_notification(user)
    @user = user
    mail(:to => user.email,
         :subject => "Welcome to Auto Workers", :from => 'Administartor@autoworkers.com')
  end
end
