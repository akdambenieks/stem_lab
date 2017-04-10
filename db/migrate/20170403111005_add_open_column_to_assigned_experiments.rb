class AddOpenColumnToAssignedExperiments < ActiveRecord::Migration[5.0]
  def change
    add_column :assigned_experiments, :open, :boolean
  end
end
