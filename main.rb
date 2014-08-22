# require "pry"
# require "sinatra"
# require "sinatra/reloader"
# require "sinatra/activerecord"
# require "sqlite3"

require 'rubygems'
require 'bundler'

Bundler.require

require_relative "./models/appt.rb"
require_relative "./models/pet.rb"
require_relative "./models/groomer.rb"
require_relative "./models/note.rb"
require_relative "./models/misc.rb"
require_relative "./routes/groomers.rb"
require_relative "./routes/pets.rb"
require_relative "./routes/appts.rb"

get "/" do
  
  erb :home
end







# binding.pry