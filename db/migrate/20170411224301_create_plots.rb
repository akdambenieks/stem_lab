class CreatePlots < ActiveRecord::Migration[5.0]
  def change
    create_table :plots do |t|
      t.references :experiment, foreign_key: true
      t.string :plot_type
      t.string :x, array: true
      t.string :y, array: true
      t.string :z, array: true

      t.timestamps
    end
  end
end
