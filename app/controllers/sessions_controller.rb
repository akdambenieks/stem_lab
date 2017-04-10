class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user && user.approved
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        session[:classroom_id] = nil
        redirect_to experiments_path, notice: 'Signed In!'
      else
        flash.now[:alert] = 'Invalid credentials'
        render :new
      end
    else
      redirect_to root_path, alert: 'We\'re sorry, your account has not been verified/approved yet.  If you have yet to receive a confirmation email please contact us.  If you have confirmed your email, please be patient; your association with your institution has not been verified yet.'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:classroom_id] = nil
    redirect_to root_path, notice: 'Signed Out!'
  end

end
