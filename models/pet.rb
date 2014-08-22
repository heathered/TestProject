
# require "prawn"

class Pet < ActiveRecord::Base
  # belongs_to :owner # foreign key - owner_id
  has_many :notes, through: :appts
  has_and_belongs_to_many :groomers
  has_many :appts
  
  def print_notes
    
    pid = id
    pname = name
    
    Prawn::Document.generate("./public/pdfs/#{pname}_notes.pdf") do
      Appt.where("pet_id = #{pid}").order("date").each do |n|
        if n.note
      	  text "#{n.date.strftime('%m/%d/%Y')} | #{n.note.note}"
        end
      end
    end
  
  end
  
end