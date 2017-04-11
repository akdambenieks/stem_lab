class RemoveDataTypesColumnFromExperiments < ActiveRecord::Migration[5.0]
  def change

    remove_column :experiments, :data_types, :json

  end
end
