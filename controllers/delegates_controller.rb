require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/delegate.rb')
also_reload('../models/*')

get '/delegates' do #index
  @delegates = Delegate.all()
  erb(:"delegates/index")
end

get '/delegates/new' do #new
  erb(:"delegates/new")
end

get '/delegates/:id' do #show
  @delegate = Delegate.find(params['id'].to_i())
  @presentations = Presentation.all()
  @delegates = Delegate.all()
  erb(:"delegates/show")
end

post '/delegates' do #create
  @delegate = Delegate.new(params)
  @delegate.save()
  erb(:"delegates/create")
end

get '/delegates/:id/edit' do #edit
  @delegate = Delegate.find(params['id'].to_i())
  erb(:"delegates/edit")
end

post '/delegates/:id' do #update
  @delegate = Delegate.new(params)
  @delegate.update()
  erb(:"delegates/update")
end

post '/delegates/:id/delete' do #destroy
  @delegate = Delegate.find(params['id'].to_i())
  @delegate.delete()
  erb(:"delegates/destroy")
end
