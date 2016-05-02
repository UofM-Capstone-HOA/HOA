class AddForeignKeys < ActiveRecord::Migration
  def change
	#Issues Foreign Keys
	add_reference :issues, :address, index: true  	
  	add_reference :issues, :home_owner, index: true
  	#add_reference :issues, :letter, index: true
  	add_reference :issues, :user, index: true
  	add_reference :issues, :issue_category, index: true

  	#Addresses Foreign Keys
	add_reference :addresses, :home_owner, index: true	

	#Letters Foreign Keys
	add_reference :letters, :issue, index: true

  end
end
