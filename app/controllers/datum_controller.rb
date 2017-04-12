class DatumController < ApplicationController

  def create
    @plot = Plot.find_by_id params[:plot_id]
    @experiment = @plot.experiment
    @classroom = current_classroom || nil
    data_params = params[:data] || []
    data_params.each do |datum|
      dat = ScatterDataSet.new
      dat.classroom = @classroom
      dat.plot = @plot
      dat.x = datum[:x]
      dat.y = datum[:y]
      dat.save
    end
    respond_to do |format|
      format.js {render}
      format.html {redirect_to experiment_path(@plot.experiment)}
    end
  end

end
