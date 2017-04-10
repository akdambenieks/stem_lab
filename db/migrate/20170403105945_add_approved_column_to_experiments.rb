class AddApprovedColumnToExperiments < ActiveRecord::Migration[5.0]
  def change
    add_column :experiments, :approved, :boolean
  end
end
