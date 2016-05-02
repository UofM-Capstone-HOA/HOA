class AddIssueStatusCategoryRefToIssues < ActiveRecord::Migration
  def change
    add_reference :issues, :issue_status_category, index: true, foreign_key: true
  end
end
