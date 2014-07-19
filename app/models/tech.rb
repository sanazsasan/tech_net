class Tech < ActiveRecord::Base
  has_and_belongs_to_many :members
  has_many :assoteches
  has_many :peers, :through => :assoteches
  has_many :inverse_assoteches, :class_name => "Assotech", :foreign_key => "peer_id"
  has_many :inverse_peers, :through => :inverse_assoteches, :source => :tech
end
