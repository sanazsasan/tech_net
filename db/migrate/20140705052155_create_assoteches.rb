class CreateAssoteches < ActiveRecord::Migration
  def change
    create_table :assoteches do |t|
      t.integer :tech_id
      t.integer :peer_id

      t.timestamps
    end
  end
end
