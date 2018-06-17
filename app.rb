require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/presentation.rb')
also_reload('./models/*')

get '/' do
  erb(:index)
end

get '/presentations' do
  @presentations = Presentation.all()
  erb(:"presentations/index")
end


# binding.pry
# nil
