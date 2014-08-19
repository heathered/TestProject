require "pry"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

require "sqlite3"

require_relative "./models/appt.rb"
require_relative "./models/pet.rb"
require_relative "./models/groomer.rb"
require_relative "./models/note.rb"
require_relative "./models/misc.rb"

get "/" do

  erb :home
end

get "/groomer" do
  @g = Groomer.find(params["id"])
  @appts = Appt.where("groomer_id = '#{params["id"]}'").order("date")
  
  erb :groomer
end

get "/groomer/new" do
  
  erb :newgroomer
end

post "/groomer/new" do
  g = Groomer.new
  g.name = params["name"]
  g.save
  
  redirect "/groomer/#{g.id}"
end

delete "/groomer/:id" do
  Groomer.find(params["id"]).destroy
  
  redirect "/"
end

get "/groomer/:id" do
  @g = Groomer.find(params["id"])
  @appts = Appt.where("groomer_id = '#{params["id"]}'").order("date")
    
  erb :groomer
end

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
  
  binding.pry
  a.save
  
  redirect "/pet/#{params["pet_id"]}"
end

# binding.pry