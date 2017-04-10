class RemoveOpenColumnFromAssignedExperiments < ActiveRecord::Migration[5.0]
  def change
    remove_column :assigned_experiments, :open
  end
end
