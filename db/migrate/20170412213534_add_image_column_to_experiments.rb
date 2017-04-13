class AddImageColumnToExperiments < ActiveRecord::Migration[5.0]
  def change
    add_column :experiments, :image, :string
  end
end
