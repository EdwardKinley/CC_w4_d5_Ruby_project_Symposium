require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/presentation.rb')
also_reload('../models/*')

get '/presentations' do #index
  @presentations = Presentation.all()
  erb(:"presentations/index")
end

get '/presentations/new' do #new
  erb(:"presentations/new")
end

get '/presentations/:id' do #show
  @presentation = Presentation.find(params['id'].to_i())
  erb(:"presentations/show")
end

# post '/presentations' do #create
#
# end
