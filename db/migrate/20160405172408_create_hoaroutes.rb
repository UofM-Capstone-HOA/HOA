class CreateHoaroutes < ActiveRecord::Migration
  def change
    create_table :hoaroutes do |t|
      t.float :lat
      t.float :long

      t.timestamps null: false
    end
  end
end
