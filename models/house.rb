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

  def self.all()
    sql = "SELECT * FROM houses"
    values = []
    result = SqlRunner.run(sql, values)
    houses = result.map {|house_hash| House.new (house_hash)}
    return houses
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    house = House.new(result.first)
    return house
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    values =[]
    SqlRunner.run(sql, values)
  end

  def self.map_items(house_data)
    result = house_data.map {|house| House.new(house)}
    return result
  end

end
