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


end
