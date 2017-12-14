require_relative('../models/student')
require_relative('../models/house')

# House.delete_all()
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

house1 = House.new({
  "house_name" => "Gryffindor",
  "url" => "Image of house 1",
  })

house2 = House.new({
  "house_name" => "Ravenclaw",
  "url" => "Image of house 2",
  })

house1.save()
house2.save()
