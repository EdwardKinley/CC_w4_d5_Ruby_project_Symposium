require_relative('../db/sql_runner.rb')

class Presentation

  attr_reader(:id, :name, :time_slot, :capacity)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @time_slot = options['time_slot'].to_i()
    @capacity = options['capacity'].to_i()
  end

  def save()
    sql = "INSERT INTO presentations (name, time_slot, capacity) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @time_slot, @capacity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

end
