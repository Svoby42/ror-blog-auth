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

Topic.create!(title: "Zprávy",
              description: "zprávy",
              slug: "zpravy")

Topic.create!(title: "Recepty",
              description: "recepty",
              slug: "recepty")

Topic.create!(title: "Právě se děje",
              description: "co se právě děje",
              slug: "co-se-prave-deje")


50.times do |n|
  title = "#{Faker::Lorem.sentence(word_count: 3)}"
  article_content = "<div>#{Faker::Lorem.paragraph(sentence_count: 5)}</div>"
  user_id = 1
  topic_id = 1
  slug = title.parameterize
  Article.create!(title: title,
                  article_content: article_content,
                  user_id: user_id,
                  topic_id: topic_id,
                  slug: slug
  )
end

10.times do |n|
  username = Faker::Name.first_name + "_#{n}"
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