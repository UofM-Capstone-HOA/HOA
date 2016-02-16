class CreateHomeOwners < ActiveRecord::Migration
  def change
    create_table :home_owners do |t|
      #t.primary_key :id
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
