class CreateInstitutions < ActiveRecord::Migration[5.0]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :street
      t.string :postal_code
      t.string :contact_phone

      t.timestamps
    end
  end
end
