ENV['RACK_ENV'] = 'test'

require "sinatra/activerecord"
require "sqlite3"

require_relative "../models/appt.rb"
require_relative "../models/pet.rb"
require_relative "../models/groomer.rb"
require_relative "../models/note.rb"
require_relative "../models/misc.rb"


RSpec.configure do |config|


end
