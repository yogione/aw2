class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end
  
  def create
    user = User.authenticate(params[:session][:email],
      params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in user
   #   redirect_back_or user
       redirect_to root_path
    end
  end

  def send_reset_password
    if params[:session][:email]
      user = User.find_by_email(params[:session][:email])
      url = "http://localhost:3000/sessions/update_reset_password?key=" + generate_token(user).token.to_s
      UserMailer.password_notification(user, url).deliver
      if user
        flash[:notice] = "A email has been sent; Please check regsitered email for password link"
      else
        flash[:notice] = "User does not exists in DB; Please check your email address"
      end
    end
    redirect_to new_session_path
  end

  def generate_token(user)
    token = Token.generate_token_for_user(user)
    return token
  end

  def new_password
    @user = User.find(params[:user_id])  if params[:user_id]
  end

  def update_reset_password
    token = Token.find_by_token(params[:key])  if params[:key]
    if token
      flash[:notice] = "Please reset your password"
      redirect_to new_password_sessions_path(:user_id => token.user_id)
    else
      flash[:notice] = "Token not available"
      redirect_to new_session_path
    end
  end

  def reset_new_password
    user = User.find(params[:user_id]) if params[:user_id]
    if params[:session][:password] == params[:session][:password_confirmation]
      user.update_attribute(:password, params[:session][:password])
      token = Token.find_by_user_id(user.id)
      token.destroy
      flash[:notice] = "Password changed successfully"
    else
      flash[:notice] = "Password error, confirmation does not match"
    end
    redirect_to new_session_path
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
