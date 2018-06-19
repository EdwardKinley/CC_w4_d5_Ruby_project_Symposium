require_relative('../db/sql_runner.rb')

class Registration

  attr_reader(:id, :presentation_id, :delegate_id)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @presentation_id = options['presentation_id'].to_i()
    @delegate_id = options['delegate_id'].to_i()
  end

  def save()
    sql = "INSERT INTO registrations (presentation_id, delegate_id) VALUES ($1, $2) RETURNING id"
    values = [@presentation_id, @delegate_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE registrations SET (presentation_id, delegate_id) = ($1, $2) WHERE id = $3"
    values = [@presentation_id, @delegate_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM registrations WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def change_presentation_id(new_presentation_id)
    sql = "UPDATE registrations SET presentation_id = $1 WHERE id = $2"
    values = [new_presentation_id, @id]
    SqlRunner.run(sql, values)
  end

  def change_delegate_id(new_delegate_id)
    sql = "UPDATE registrations SET delegate_id = $1 WHERE id = $2"
    values = [new_delegate_id, @id]
    SqlRunner.run(sql, values)
  end

  def delegate()
    sql = "SELECT * FROM (delegates d INNER JOIN registrations r ON d.id = r.delegate_id) WHERE r.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return Delegate.new(result.first)
  end

  def presentation()
    sql = "SELECT * FROM (presentations p INNER JOIN registrations r ON p.id = r.presentation_id) WHERE r.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return Presentation.new(result.first)
  end

  def self.map_items(data)
    return data.map{|datum| Registration.new(datum)}
  end

  def self.all()
    sql = "SELECT * FROM registrations"
    registrations = SqlRunner.run(sql)
    return Registration.map_items(registrations)
  end

  def self.delete_all()
    sql = "DELETE FROM registrations"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM registrations WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Registration.new(result.first)
  end

  def self.destroy(id)
    sql = "DELETE FROM registrations WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end


end
