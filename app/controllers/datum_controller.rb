class DatumController < ApplicationController

  def create


    @experiment = Experiment.find_by_id params[:experiment_id]
    @classroom = current_classroom || nil
    data_params = params[:data] || []
    data_params.each do |datum|
      dat = ScatterDataSet.new
      dat.classroom = @classroom
      dat.experiment = @experiment
      dat.x = datum[:x]
      dat.y = datum[:y]
      dat.save
    end
    respond_to do |format|
      format.js {render }
      format.html {redirect_to experiment_path(@experiment)}
    end
  end

end
