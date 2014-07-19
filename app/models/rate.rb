class Rate < ActiveRecord::Base
  belongs_to :rater_member, class_name: "Member"
  belongs_to :rated_member, class_name: "Member"

  
 # validates_uniqueness_of :id, scope: :member_id
 # validates_inclusion_of :value, in: [0, 101]
end
