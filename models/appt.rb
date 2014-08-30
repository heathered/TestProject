class Appt < ActiveRecord::Base
  belongs_to :groomer # foreign key - groomer_id
  belongs_to :pet # foreign key - pet_id
  has_one :note
  
  validates :date, :groomer_id, :pet_id, presence: true
  
  def set_date(date)
    appt = Chronic.parse(date)
    self.date = appt
  end
  
  def prettytime
    self.date.localtime.strftime("%A, %B #{self.date.day.ordinalize} %Y @ %l:%M %p")
  end
  
  def basictime
    self.date.localtime.strftime("%m/%d/%Y")
  end
  
  def upcoming?
    self.date > Time.now
  end
  
  def past?
    self.date < Time.now
  end
  
  def valid_appt?
    self.groomer_id && self.pet_id
  end
  
end