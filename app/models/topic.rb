class Topic < ActiveRecord::Base
  belongs_to :group
  belongs_to :creator, :class_name => "User"
  has_many :comments, :as => :commentable
end
