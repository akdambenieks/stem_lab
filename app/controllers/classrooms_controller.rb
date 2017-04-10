class ClassroomsController < ApplicationController

  def index
    @classrooms = current_user.classrooms
  end

  def show
    @classroom = Classroom.find_by_id params[:id]
    @experiments = current_user.bookmarked_experiments
  end

  def new
    @classroom = Classroom.new
    redirect_to root_path, alert: 'You are not authorized to create classrooms' unless (current_user.role == 'educator' || current_user.role == 'admin')
  end

  def create
    classroom_params = params.require(:classroom).permit(:code_name, :password, :password_confirmation)
    if current_user.role == 'educator' || current_user.role == 'admin'
      @classroom = Classroom.new(classroom_params)
      @classroom.user = current_user
      @classroom.institution = current_user.institution
      if @classroom.save
        redirect_to classroom_path(@classroom), notice: 'Classroom created successfully!'
      else
        flash.now[:alert] = "The classroom was not created successfully, please fix the following errors: #{@classroom.errors.full_messages.join(', ')}"
        render new_classroom_path
      end
    else
      redirect_to root_path, alert: 'You are not authorized to create classrooms'
    end
  end

end
