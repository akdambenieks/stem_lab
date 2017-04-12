class UpdateScatterDataSetsTableFromReferenceToExperimentToPlot < ActiveRecord::Migration[5.0]
  def change

    remove_reference :scatter_data_sets, :experiment
    add_reference :scatter_data_sets, :plot

  end
end
