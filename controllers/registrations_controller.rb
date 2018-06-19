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

get '/registrations/:id/edit' do #edit
  @presentations = Presentation.all()
  @delegates = Delegate.all()
  @registration = Registration.find(params['id'].to_i())
  erb(:"registrations/edit")
end

post '/registrations/:id' do #update
  @registration = Registration.new(params)
  @registration.update()
  erb(:"registrations/update")
end

post '/registrations/:id/delete' do #destroy
  @registration = Registration.find(params['id'].to_i())
  @presentation_name = @registration.presentation.name()
  @delegate_name = @registration.delegate.name()
  @registration.delete()
  erb(:"registrations/destroy")
end
