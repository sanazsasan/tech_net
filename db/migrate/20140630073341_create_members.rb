class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :username
      t.string :name
      t.string :lastname
      t.string :email
      t.string :password
      t.string :experiences

      t.timestamps
    end
  end
end
