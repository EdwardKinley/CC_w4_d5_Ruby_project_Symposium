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
  erb(:"delegates/show")
end

post '/delegates' do #create
  @delegate = Delegate.new(params)
  @delegate.save()
  erb(:"delegates/create")
end
