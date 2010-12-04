class Photo < ActiveRecord::Base
  belongs_to :album
  has_attached_file :image, 
                    :styles => {:thumbnails => "200x200#", :show_size => "1024x768>" }
  has_many :comments, :as => :commentable
end
