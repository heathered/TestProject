require "chronic"

class Appt < ActiveRecord::Base
  belongs_to :groomer # foreign key - groomer_id
  belongs_to :pet # foreign key - pet_id
  has_one :note
  
  def set_date(date)
    appt = Chronic.parse(date)
    self.date = appt
  end
  
end