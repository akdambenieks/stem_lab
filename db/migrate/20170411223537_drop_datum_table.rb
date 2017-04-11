class DropDatumTable < ActiveRecord::Migration[5.0]
  def change

    drop_table :data

  end
end
