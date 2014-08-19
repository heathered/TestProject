class Note < ActiveRecord::Base
  belongs_to :appt # foreign key - appt_id
  
end