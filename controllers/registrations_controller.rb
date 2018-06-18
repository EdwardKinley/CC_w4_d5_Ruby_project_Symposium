require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/registration.rb')
also_reload('../models/*')

get '/registrations' do
  @registrations = Registration.all()
  erb(:"registrations/index")
end

get '/registrations/:id' do
  @registration = Registration.find(params['id'].to_i())
  erb(:"registrations/show")
end
