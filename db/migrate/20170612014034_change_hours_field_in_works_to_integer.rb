class ChangeHoursFieldInWorksToInteger < ActiveRecord::Migration[5.0]
  def change
  	remove_column :works, :hours
  	add_column :works, :hours, :integer
  end
end
