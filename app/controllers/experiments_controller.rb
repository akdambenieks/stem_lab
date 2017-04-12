class ExperimentsController < ApplicationController

  def index
    if user_signed_in? && (current_user.role == 'admin' || current_user.role == 'expert')
      @experiments = Experiment.order(id: :asc)
    elsif user_signed_in? && current_user.role == 'educator'
      @experiments = Experiment.where(approved: true).order(id: :asc)
    elsif student_signed_in?
      @experiments = current_classroom.experiments.order(id: :asc)
    else
      @experiments = []
    end
    @tags = Tag.all
  end

  def show
    @experiment = Experiment.find_by_id params[:id]
    @materials = @experiment.materials.order(id: :asc) || []
    @procedures = @experiment.procedures.order(step: :asc) || []
    @plot = @experiment.plots.first
  end

  def new
    @experiment = Experiment.new
    @tags_left = Tag.order(name: :asc).limit((Tag.count / 2 + 0.1).ceil)
    @tags_right = Tag.order(name: :asc).offset((Tag.count / 2 + 0.1).ceil)
  end

  def create
    # render json: params
    experiment_params = params.require(:experiment).permit(:title, :description)
    material_params = params[:material] || []
    procedure_params = params[:procedure] || []
    plot_params = params[:plot] || []

    @experiment = Experiment.new(experiment_params)
    @experiment.user = current_user



    # if @experiment.save
    #   material_params.each do |mat|
    #     material = Material.new
    #     material.quantity = mat[:quantity]
    #     material.units = mat[:units]
    #     material.name = mat[:name]
    #     material.experiment = @experiment
    #     material.save
    #   end
    #
    #   proc_step = 1
    #   procedure_params.each do |pro|
    #     procedure = Procedure.new
    #     procedure.step = proc_step
    #     procedure.description = pro[:description]
    #     procedure.experiment = @experiment
    #     procedure.save
    #     proc_step += 1
    #   end

      # if params[:tags]
      #   tag_params = params[:tags] ? params[:tags][0] : []
      #   tag_ids = tag_params.keys
      #   tag_ids.each do |t|
      #     tagging = Tagging.new
      #     tagging.taggable_type = 'experiment'
      #     tagging.taggable_id = @experiment.id
      #     tagging.tag = Tag.find_by_id t
      #     tagging.save
      #   end

      # end

      if params[:plot]
        plot = Plot.new
        plot.experiment = @experiment
        plot.plot_type = plot_params[:type]
        plot.x = [plot_params[:xaxis]] || []
        plot.y = [plot_params[:yaxis]] || []
        plot.z = [plot_params[:zaxis]] || []
        render json: plot
      end

    #
    # end

  end

end
