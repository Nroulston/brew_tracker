ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'



task :console do
  Pry.start
end

# desc "Drops both development and testing databases"
# task :drop_all do  
#   puts "Dropping the databases...."  system "rm db/development.sqlite && rm db/schema.rb"
# end



# (name: params[:hop][0][

  # recipe.hops.find_or_create_by(name: params[:hop][0][:name], form: params[:hop][0][:form], alpha_acid: params[:hop][0][:alpha_acid])