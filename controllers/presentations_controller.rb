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

post '/presentations' do #create
  @presentation = Presentation.new(params)
  @presentation.save()
  erb(:"presentations/create")
end

get '/presentations/:id/edit' do #edit
  @presentation = Presentation.find(params['id'].to_i())
  erb(:"presentations/edit")
end

post '/presentations/:id' do #update
  @presentation = Presentation.new(params)
  @presentation.update
  erb(:"presentations/update")
end

post '/presentations/:id/delete' do #destroy
  @presentation = Presentation.find(params['id'].to_i())
  @presentation.delete()
  erb(:"presentations/destroy")
end
