class CreateJoinTableMemberTech < ActiveRecord::Migration
  def change
    create_join_table :members, :teches do |t|
       t.index [:member_id, :tech_id]
       t.index [:tech_id, :member_id]
    end
  end
end
