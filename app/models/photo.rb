class Photo < ActiveRecord::Base
  belongs_to :album
  has_attached_file :image, 
                    :styles => {:thumbails => "200x200>"}
end
