class CreateScatterDataSets < ActiveRecord::Migration[5.0]
  def change
    create_table :scatter_data_sets do |t|
      t.references :experiment, foreign_key: true
      t.references :classroom, foreign_key: true
      t.float :x
      t.float :y

      t.timestamps
    end
  end
end
