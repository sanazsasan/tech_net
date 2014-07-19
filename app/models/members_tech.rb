class MembersTech < ActiveRecord::Base
  
  belongs_to :teches
  belongs_to :members

end
