class AddDataTypesColumnToExperiments < ActiveRecord::Migration[5.0]
  def change
    add_column :experiments, :data_types, :json
  end
end
