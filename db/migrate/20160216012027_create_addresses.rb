class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      #t.primary_key :id
      t.string :number
      t.string :street
      t.string :city
      t.string :state
      t.string :country , default: "USA"
      t.string :postalcode, default: "38103"
      #t.references :homeOwner, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
