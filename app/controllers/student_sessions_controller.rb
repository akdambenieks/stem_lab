class StudentSessionsController < ApplicationController

  def new
  end

  def create
    classroom = Classroom.find_by_code_name params[:code_name]
    if classroom&.authenticate(params[:password])
      session[:classroom_id] = classroom.id
      session[:user_id] = nil
      redirect_to experiments_path, notice: 'Signed In!'
    else
      flash.now[:alert] = 'Invalid credentials'
      render :new
    end
  end

  def destroy
    session[:classroom_id] = nil
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed Out!'
  end

end
