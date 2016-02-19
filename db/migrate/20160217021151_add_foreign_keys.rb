class AddForeignKeys < ActiveRecord::Migration
  def change
	#Issues Foreign Keys
	add_reference :issues, :address, index: true  	
  	add_reference :issues, :homeOwner, index: true
  	add_reference :issues, :letter, index: true
  	add_reference :issues, :user, index: true
  	add_reference :issues, :issueCategory, index: true

  	#Addresses Foreign Keys
	add_reference :addresses, :homeOwner, index: true  	

	#Letters Foreign Keys
	add_reference :letters, :issue, index: true

  end
end
