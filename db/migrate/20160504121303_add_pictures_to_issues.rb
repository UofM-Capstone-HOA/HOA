class AddPicturesToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :pictures, :json
  end
end
