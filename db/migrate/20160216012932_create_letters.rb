class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      #t.primary_key :id
      t.references :issue, index: true, foreign_key: true
      t.integer :letterNum
      t.datetime :date

      t.timestamps null: false
    end
  end
end
