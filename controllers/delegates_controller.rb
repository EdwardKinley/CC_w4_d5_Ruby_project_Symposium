require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/delegate.rb')
also_reload('../models/*')

get '/delegates' do
  @delegates = Delegate.all()
  erb(:"delegates/index")
end

get '/delegates/:id' do
  @delegate = Delegate.find(params['id'].to_i())
  erb(:"delegates/show")
end
