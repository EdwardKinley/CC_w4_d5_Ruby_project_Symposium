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

  def self.map_items(data)
    return data.map{|datum| Presentation.new(datum)}
  end

  def self.all()
    sql = "SELECT * FROM presentations"
    presentations = SqlRunner.run(sql)
    return Presentation.map_items(presentations)
  end

  def self.delete_all()
    sql = "DELETE FROM presentations"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM presentations WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Presentation.new(result.first)
  end

  def self.destroy(id)
    sql = "DELETE FROM presentations WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
