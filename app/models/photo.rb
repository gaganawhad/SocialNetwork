class Photo < ActiveRecord::Base
  belongs_to :album
  has_attached_file :photo, 
                    :styles => {:thumbails => "200x200>"}
end
