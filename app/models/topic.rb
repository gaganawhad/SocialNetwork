class Topic < ActiveRecord::Base
  belongs_to :group
  belongs_to :creator, :class_name => "User"
end
