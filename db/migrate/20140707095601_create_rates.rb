class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :rater_id
      t.integer :rated_id
      t.integer :score
      #t.index [:member_id, :tech_id]
      #t.index :rates, [:rater_id, :rated_id], :unique => true
      #t.index [:rater_id, :rated_id]
    end
    add_index :rates, [:rater_id, :rated_id], :unique => true
  end
end
