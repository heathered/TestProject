class Owner < ActiveRecord::Base
  has_many :pets
  has_and_belongs_to_many :groomers
  
end