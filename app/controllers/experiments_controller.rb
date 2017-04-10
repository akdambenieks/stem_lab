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
    data_hash = @experiment.data_types ? (JSON.parse @experiment.data_types) : {}
    @data_list = data_hash.to_a
    @data = @experiment.data ? @experiment.data : {}
  end

  def new
    @experiment = Experiment.new
    @tags_left = Tag.order(name: :asc).limit((Tag.count / 2 + 0.1).ceil)
    @tags_right = Tag.order(name: :asc).offset((Tag.count / 2 + 0.1).ceil)
  end

  def create
    render json: params
    experiment_params = params.require(:experiment).permit(:title, :description)
    material_params = params[:material] || []
    procedure_params = params[:procedure] || []
    proc_step = 1

    @experiment = Experiment.new(experiment_params)
    data_hash = {}
    data_structure = params[:experiment][:data] || []
    data_structure.each do |datum|
      if datum['name'] != ''
        data_hash[datum['name']] = datum['type']
      end
    end
    @experiment.user = current_user
    @experiment.data_types = data_hash.to_json

    if @experiment.save
      material_params.each do |mat|
        material = Material.new
        material.quantity = mat[:quantity]
        material.units = mat[:units]
        material.name = mat[:name]
        material.experiment = @experiment
        material.save
      end

      procedure_params.each do |pro|
        procedure = Procedure.new
        procedure.step = proc_step
        procedure.description = pro[:description]
        procedure.experiment = @experiment
        procedure.save
        proc_step += 1
      end
    end

    tag_params = params[:tags][0] || []
    tag_ids = tag_params.keys
    tag_ids.each do |t|
      tagging = Tagging.new
      tagging.taggable_type = 'experiment'
      tagging.taggable_id = @experiment.id
      tagging.tag = Tag.find_by_id t
      tagging.save
    end
  end

end
