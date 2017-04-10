class CreateClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :classrooms do |t|
      t.string :code_name
      t.string :password_digest
      t.references :user, foreign_key: true
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
