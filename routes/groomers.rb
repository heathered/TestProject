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