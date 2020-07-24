ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'



task :console do
  Pry.start
end

desc "Drops both development and testing databases"
task :drop_all do  
  puts "Dropping the databases...."  system "rm db/development.sqlite && rm db/schema.rb"
end

