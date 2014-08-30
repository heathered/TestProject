get "/pet" do
  @p = Pet.find(params["id"])
  @appts = Appt.where("pet_id = '#{params["id"]}'").order("date")
  
  erb :pet
end

get "/pet/new" do
  
  erb :newpet
end

delete "/pet/:id" do
  Pet.find(params["id"]).destroy
  
  redirect "/"
end

get "/pet/:id" do
  @p = Pet.find(params["id"])
  @appts = Appt.where("pet_id = '#{params["id"]}'").order("date")
  @groomers = Groomer.all
  
  erb :pet
end

get "/pet/:id/pdf" do
  @p = Pet.find(params["id"])
  @p.print_notes
  
  erb :pdf
  # redirect "/pet/#{@p.id}"
end

post "/pet/new" do
  p = Pet.new
  p.name = params["name"]
  p.save
  
  redirect "/pet/#{p.id}"
end