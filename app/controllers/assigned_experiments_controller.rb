class AssignedExperimentsController < ApplicationController

  def create
    a_e_params = params.require(:assigned_experiment).permit(:classroom_id, :experiment_id)
    experiment = Experiment.find_by_id(a_e_params[:experiment_id])
    if experiment.approved == true
      if AssignedExperiment.create(a_e_params)
        redirect_to classroom_path(a_e_params[:classroom_id]), notice: 'Experiment assigned to this class'
      else
        redirect_to classroom_path(a_e_params[:classroom_id]), alert: 'Failed to assign the experiment'
      end
    else
      flash.now[:alert] = 'Sorry, this experiment is in development and can\'t be assigned yet'
      render classroom_path(a_e_params[:classroom_id])
    end
  end

  def destroy
    assigned_experiment = AssignedExperiment.find_by_id(params[:id])
    if assigned_experiment.destroy
      redirect_to classroom_path(assigned_experiment.classroom_id), notice: 'Experiment unassigned from this class'
    else
      redirect_to classroom_path(assigned_experiment.classroom_id), alert: 'Failed to unassign the experiment'
    end
  end

end
