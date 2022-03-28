# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(username: "vyskocil",
             full_name: "Josef Vyskočil",
             email: "vyskocil@seznam.cz",
             password: "hesloheslo",
             last_login: nil,
             role: "ADMIN",
             password_confirmation: "hesloheslo")

99.times do |n|
  username = Faker::Name.first_name + ".#{n}"
  full_name = Faker::Name.first_name + " " + Faker::Name.last_name
  email = "usernumber.#{n}@seznam.cz"
  password = "password"
  User.create!(username: username,
               full_name: full_name,
               email: email,
               password: password,
               password_confirmation: password,
  )

end