require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/registration.rb')
also_reload('../models/*')

get '/registrations' do #index
  @registrations = Registration.all()
  erb(:"registrations/index")
end

get '/registrations/new' do #new
  @presentations = Presentation.all
  @delegates = Delegate.all
  erb(:"registrations/new")
end

get '/registrations/:id' do #show
  @registration = Registration.find(params['id'].to_i())
  erb(:"registrations/show")
end

post '/registrations' do #create
  @registration = Registration.new(params)
  @registration.save()
  erb(:"registrations/create")
end
