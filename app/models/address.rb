class Address < ActiveRecord::Base
  has_one :user
  def one_string
    one_line = ""
    [:line_1, :line_2, :city, :state, :zip].each do |field|
      unless self.send(field).nil? 
        one_line = one_line + self.send(field) + " "
      end
    end
    one_line
  end 
end
