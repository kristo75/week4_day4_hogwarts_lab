require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/student.rb')
require_relative('./models/house.rb')

# INDEX - show all students

get('/students') do
  @students = Student.all()
  erb(:index)
end

# NEW - gets new student data from user

get('/students/new') do
  @houses = House.all()
  erb(:new)
end

# CREATE - saves new student to database

post('/students') do
  @student = Student.new(params)
  @student.save()
  params.to_s()
  erb(:create)
end

#
