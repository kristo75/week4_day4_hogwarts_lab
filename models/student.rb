require_relative('../db/sql_runner')
require_relative('house.rb')

class Student

  attr_reader(:id, :first_name, :last_name, :house_id, :age )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id']
    @age = options['age'].to_i

  end

  def find_students_house
    sql = "SELECT houses.*
    FROM houses
    INNER JOIN students
    ON students.house_id = houses.id
    WHERE students.house_id = $1
    "
    values = [@house_id]
    result = SqlRunner.run(sql,values)
    return House.map_items(result)

  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      last_name,
      house_id,
      age
    )
    VALUES ($1, $2, $3, $4)
    RETURNING *"
    values =[@first_name, @last_name, @house_id, @age]
    student_data = SqlRunner.run(sql,values)
    @id = student_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students"
    values = []
    result = SqlRunner.run(sql, values)
    students = result.map {|student_hash| Student.new (student_hash)}
    return students
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    student = Student.new(result.first)
    return student
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    values =[]
    SqlRunner.run(sql, values)
  end

end
