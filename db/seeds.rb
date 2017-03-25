# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.where(name: "Web Development").first_or_create(name: "Web Development")
Category.where(name: "Design").first_or_create(name: "Design")
Category.where(name: "Administrative").first_or_create(name: "Administrative")

location = [
  "San Francisco, CA",
  "Sydney, Australia",
  "Tokyo, Japan",
  "London, UK",
  "New York, NY",
  "Hong Kong",
  "Paris, France",
  "Melbourne, Australia",
  "Wellington, NZ"
]

User.where(email: "bob@email.com").first_or_create(email: "Bob Brown", password: "pw")

10.times do
  User.create(email: Faker::Internet.email, password: "pwpwpwpwpw")
end

100.times do
  Gig.create(name: Faker::Name.title,
            description: Faker::Lorem.paragraph(2),
            budget: rand(200...10000),
            location: location.sample,
            user_id: 1,
            category_id: rand(1..3))
end