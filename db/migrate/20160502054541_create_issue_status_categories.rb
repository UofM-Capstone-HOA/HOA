class CreateIssueStatusCategories < ActiveRecord::Migration
  def change
    create_table :issue_statuses do |t|
      t.string :name
    end
  end
end
