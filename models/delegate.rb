require_relative('../db/sql_runner.rb')

class Delegate

  attr_reader(:id, :name, :board_member)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    options['board_member'] = false if !options['board_member']
    @board_member = options['board_member']
  end

  def save()
    sql = "INSERT INTO delegates (name, board_member) VALUES ($1, $2) RETURNING id"
    values = [@name, @board_member]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def register(presentation)
    registration = Registration.new({"presentation_id"=>presentation.id, "delegate_id"=>self.id})
    registration.save
  end

  def rename(new_name)
    sql = "UPDATE delegates SET name = $1 WHERE id = $2"
    values = [new_name, @id]
    SqlRunner.run(sql, values)
  end

  def change_board_member(new_value)
    sql = "UPDATE delegates SET board_member = $1 WHERE id = $2"
    values = [new_value, @id]
    SqlRunner.run(sql, values)
  end

  def presentations()
    sql = "SELECT * FROM (presentations p INNER JOIN registrations r ON p.id = r.presentation_id) WHERE delegate_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Presentation.map_items(results)
  end

  def self.map_items(data)
    return data.map{|datum| Delegate.new(datum)}
  end

  def self.all()
    sql = "SELECT * FROM delegates"
    delegates = SqlRunner.run(sql)
    return Delegate.map_items(delegates)
  end

  def self.delete_all()
    sql = "DELETE FROM delegates"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM delegates WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Delegate.new(result.first)
  end

  def self.destroy(id)
    sql = "DELETE FROM delegates WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end


end
