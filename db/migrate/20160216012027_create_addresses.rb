class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      #t.primary_key :id
      t.integer :number
      t.string :street
      t.string :city
      t.string :state
      t.string :country , default: "USA"
      #t.references :homeOwner, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
