class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      #t.primary_key :id
      t.datetime :date
      t.references :address, index: true, foreign_key: true
      t.references :homeowner, index: true, foreign_key: true
      t.references :letter, index: true, foreign_key: true
      t.boolean :lien
      t.boolean :resolved
      #t.references :user, index: true, foreign_key: true
      t.text :note
      t.string :picture
      t.references :issueCategory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
