require_relative('../db/sql_runner.rb')

class House

  attr_reader(:id, :house_name, :url)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @house_name = options['house_name']
    @url = options['url']
  end

  def save()
    sql = "INSERT INTO houses
    (house_name, url)
    VALUES($1, $2)
    RETURNING *"

    values = [@house_name, @url]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first()['id'].to_i
  end
end
