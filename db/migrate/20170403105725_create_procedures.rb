class CreateProcedures < ActiveRecord::Migration[5.0]
  def change
    create_table :procedures do |t|
      t.references :experiment, foreign_key: true
      t.integer :step
      t.text :description

      t.timestamps
    end
  end
end
