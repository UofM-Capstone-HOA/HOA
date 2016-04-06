class AddUserToHoaroute < ActiveRecord::Migration
  def change
  	add_reference :hoaroutes, :user, index: true
  end
end
