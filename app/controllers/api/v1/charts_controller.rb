class Api::V1::ChartsController < Api::BaseController

  def index

  end

  def show
    @experiment = Experiment.find params[:id]
    @classroom = current_classroom || Classroom.new
    @all_data = @experiment.scatter_data_sets
    @class_data = @experiment.scatter_data_sets.where(classroom_id: current_classroom)
  end

  def create

  end

  def destroy
  end

  def update
  end

end
