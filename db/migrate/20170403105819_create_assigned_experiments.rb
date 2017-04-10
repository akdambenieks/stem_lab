class CreateAssignedExperiments < ActiveRecord::Migration[5.0]
  def change
    create_table :assigned_experiments do |t|
      t.references :classroom, foreign_key: true
      t.references :experiment, foreign_key: true

      t.timestamps
    end
  end
end
