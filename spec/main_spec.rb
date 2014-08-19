require "spec_helper"

describe Appt do
  
  it "should parse time correctly" do 
    a = Appt.new
    a.set_date("Tomorrow at 12pm")
    today = Time.now
    
    expect(a.date).to be > today
  end
  
end

describe Pet do
  
  it "should create pdf" do
    p = Pet.find(1)
    p.print_notes
    
    # ???????
  end
  
end