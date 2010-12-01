class Group < ActiveRecord::Base
  has_attached_file :picture
  has_many :memberships
  has_many :members, :class_name => "User", :through => :memberships
#--------------------------------------------------
#   belongs_to :owner, :class_name => "User", :foreign_key => :owner_id #NOTE trying out ownership in memberships itself
#-------------------------------------------------- 
end
