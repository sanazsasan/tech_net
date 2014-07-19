class Assotech < ActiveRecord::Base
  belongs_to :tech 
  belongs_to :peer, :class_name => "Tech"
end
