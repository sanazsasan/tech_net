class AddfilenameToMembers < ActiveRecord::Migration
  def change
  	add_column :members, :filename, :string
  end
end
