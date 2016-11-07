# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create Wikis

require 'random_data'

# Create an admin user
admin = User.create!(
  email:    'admin@example.com',
  password: 'helloworld',
  confirmed_at: 'Thu, 03 Nov 2016 22:25:15 -0400'
)

# Create a member
member = User.create!(
  email:    'member@example.com',
  password: 'helloworld',
  confirmed_at: 'Thu, 03 Nov 2016 22:25:15 -0400'
)

# Create a member
a = User.create!(
  email:    'a@example.com',
  password: 'password',
  confirmed_at: 'Thu, 03 Nov 2016 22:25:15 -0400'
)

50.times do
  Wiki.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    user:   admin
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{Wiki.count} wikis created"
