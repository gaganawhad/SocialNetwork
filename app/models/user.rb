require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  

  has_attached_file :picture, 
                    :styles => {:small => "100x100>", :large => "500x500>"}
  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message
  validates_inclusion_of :gender, :in => ["male", "female", nil, ""]

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation, :first_name, :last_name, :gender, :picture_file_name, :picture_content_type, :picture_file_size, :picture_updated_at, :address_id, :address_attributes, :picture

  belongs_to :address
  has_many :albums 
  has_many :memberships
  has_many :groups, :through => :memberships
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => :friend_id
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
#--------------------------------------------------
#   has_many :owned_groups, :class => "Group" #NOTE Trying out ownership in memberships itself
#-------------------------------------------------- 
  accepts_nested_attributes_for :address


  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end
  
  def real_friends
    real_friends = self.friends + self.inverse_friends
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

#--------------------------------------------------
#   def friends
#     freinds = Friendship.find(:all, :conditions => ["initiator_id = #{self.id} || acceptor_id = #{self.id}"])
#   end
# 
#   def request_friendship (user)
#     friendship = Friendship.new
#     friendship.initiator_id = 1
#     friendship.acceptor_id = user.id
#     friendship.state = "requested"
#     friendship.save!
#   end
#   def accept_friendship (user)
#     friendship = Friendship.find(user.id)
#     friendship.state = "accepted"
#     friendship.save!
#   end
#   def reject_friendship (user)
#     friendship = Friendship.find(user.id)
#     friendship.state = "rejected"
#     friendship.save!
#   end
#-------------------------------------------------- 
  
end
