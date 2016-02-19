class CreateIssueCategories < ActiveRecord::Migration
  def change
    create_table :issue_categories do |t|
      #t.primary_key :id
      t.string :name

      t.timestamps null: false
    end
  end
end
