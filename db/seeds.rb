require_relative('../models/student')

# Student.delete_all()

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_name" => "Gryffindor",
  "age" => 16
  })

  student2 = Student.new({
    "first_name" => "Hermione",
    "last_name" => "Granger",
    "house_name" => "Ravenclaw",
    "age" => 15
    })

student1.save()
student2.save()
