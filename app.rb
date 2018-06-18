require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/presentations_controller.rb')
require_relative('controllers/delegates_controller.rb')
require_relative('controllers/registrations_controller.rb')
also_reload('./models/*')

require('pry-byebug')

get '/' do
  erb(:index)
end





# binding.pry
# nil
