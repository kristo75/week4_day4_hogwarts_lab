require_relative('../models/student')
require_relative('../models/house')

House.delete_all()
Student.delete_all()

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

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => house1.id,
  "age" => 16
  })

  student2 = Student.new({
    "first_name" => "Hermione",
    "last_name" => "Granger",
    "house_id" => house2.id,
    "age" => 15
    })

student1.save()
student2.save()
