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



end
