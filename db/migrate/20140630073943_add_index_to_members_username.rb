class AddIndexToMembersUsername < ActiveRecord::Migration
  def change
	add_index :members, :username, unique: true
  end
end
