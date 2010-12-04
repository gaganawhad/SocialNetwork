class Photo < ActiveRecord::Base
  belongs_to :album
  has_attached_file :image, 
                    :styles => {:small => "84x84#", :thumbnail => "200x200#", :show_size => "1024x768>" }
  has_many :comments, :as => :commentable
end
