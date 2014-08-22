get "/appt/:id" do
  @a = Appt.find(params["id"])
  
  erb :appt
end

post "/appt/:id/note" do
  @a = Appt.find(params["id"])
  
  n = Note.new
  n.appt_id = params["id"]
  n.note = params["note"]
  n.save
  
  redirect "/pet/#{@a.pet.id}"
end

get "/appt/:id/edit" do
  @a = Appt.find(params["id"])
  
  erb :edit
end

post "/appt/:id/edit" do
  @a = Appt.find(params["id"])
  Note.update(@a.note.id, note: "#{params["note"]}")
  
  redirect "/pet/#{@a.pet.id}"
end

delete "/appt/:id/deletenote" do
  @a = Appt.find(params["id"])
  Appt.find(params["id"]).note.destroy
  
  redirect "/pet/#{@a.pet.id}"
end

delete "/appt/:id/deleteappt" do
  @a = Appt.find(params["id"])
  Appt.find(params["id"]).destroy
  
  redirect "/pet/#{@a.pet.id}"
end

post "/appt" do
  
  a = Appt.new
  a.pet_id = params["pet_id"]
  a.groomer_id = params["groomer_id"]
  a.set_date(params["date"])
  
  if a.valid?
    a.save
    redirect "/pet/#{params["pet_id"]}"
  else
    
  end
end