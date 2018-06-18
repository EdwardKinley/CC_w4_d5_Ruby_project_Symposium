require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/presentation.rb')
also_reload('../models/*')

get '/presentations' do
  @presentations = Presentation.all()
  erb(:"presentations/index")
end

get '/presentations/:id' do
  @presentation = Presentation.find(params['id'].to_i())
  erb(:"presentations/show")
end
