# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u=User.new
u.email = 'admin@test.com'
u.password = '123456'
u.password_confirmation = '123456'
u.is_admin = true
u.save

a = User.new(email:"123@gmail.com",password:"123456",password_confirmation:"123456",is_admin:true)
a.save

b = User.create(email:"678@gmail.com",password:"123456",password_confirmation:"123456")
b.is_admin=true
b.save

c=User.create(email:"000@gmail.com",password:"123456",password_confirmation:"123456")

d=User.new(email:"666@gmail.com",password:"123456",password_confirmation:"123456",is_admin:true)
