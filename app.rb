require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/presentation.rb')
also_reload('./models/*')

get '/presentations/' do
  @presentations = Presentation.all()
  # erb(:index)
end


binding.pry
nil
