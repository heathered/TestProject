class Groomer < ActiveRecord::Base
  has_and_belongs_to_many :pets
  has_many :notes, through: :appts
  has_many :appts
  
end