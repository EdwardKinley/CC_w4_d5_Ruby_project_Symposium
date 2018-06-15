require_relative('../db/sql_runner.rb')

class Presentation

  attr_reader(:id, :name, :time_slot, :capacity)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @time_slot = options['time_slot'].to_i()
    @capacity = options['capacity'].to_i()
  end



end
