class CreateData < ActiveRecord::Migration[5.0]
  def change
    create_table :data do |t|
      t.references :experiment, foreign_key: true
      t.references :classroom, foreign_key: true
      t.json :data_set

      t.timestamps
    end
  end
end
