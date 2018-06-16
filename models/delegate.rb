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

end
