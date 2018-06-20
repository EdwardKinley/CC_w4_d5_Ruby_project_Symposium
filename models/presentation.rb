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

  def update()
    sql = "UPDATE presentations SET (name, time_slot, capacity) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @time_slot, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM presentations WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def register(delegate)
    registration = Registration.new({"presentation_id" => self.id, "delegate_id" => delegate.id})
    registration.save()
  end

  def rename(new_name)
    sql = "UPDATE presentations SET name = $1 WHERE id = $2"
    values = [new_name, @id]
    SqlRunner.run(sql, values)
  end

  def change_time_slot(new_time_slot)
    sql = "UPDATE presentations SET time_slot = $1 WHERE id = $2"
    values = [new_time_slot, @id]
    SqlRunner.run(sql, values)
  end

  def change_capacity(new_capacity)
    sql = "UPDATE presentations SET capacity = $1 WHERE id = $2"
    values = [new_capacity, @id]
    SqlRunner.run(sql, values)
  end

  def delegates()
    sql = "SELECT d.* FROM delegates d INNER JOIN registrations r ON d.id = r.delegate_id WHERE presentation_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Delegate.map_items(results)
  end

  def capacity_color()
    return "red" if @capacity == 0
    return "amber" if @capacity < 10 && @capacity > 0
    return "green"
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
