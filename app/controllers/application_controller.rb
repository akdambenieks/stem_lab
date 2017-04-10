class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user!
    redirect_to new_session_path, alert: 'Please sign in' unless user_signed_in?
  end

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_user
    User.find session[:user_id] if user_signed_in?
  end
  helper_method :current_user

  def student_signed_in?
    session[:classroom_id].present?
  end
  helper_method :student_signed_in?

  def current_classroom
    Classroom.find session[:classroom_id] if student_signed_in?
  end
  helper_method :current_classroom


end
