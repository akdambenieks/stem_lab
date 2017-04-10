class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.float :quantity
      t.string :units
      t.string :name
      t.references :experiment, foreign_key: true

      t.timestamps
    end
  end
end
