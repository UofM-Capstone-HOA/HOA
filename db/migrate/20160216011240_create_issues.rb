class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.datetime :date
      #t.references :address, index: true, foreign_key: true
      #t.references :homeowner, index: true, foreign_key: true
      #t.references :letter, index: true, foreign_key: true
      t.boolean :lien, default: false
      t.boolean :resolved, default: false
      #t.references :user, index: true, foreign_key: true
      t.text :note
      t.string :picture
      #t.references :issueCategory, index: true, foreign_key: true
      #t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
