# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create Wikis

require 'faker'

# Create Users
20.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(8),
    role: 'standard'
  )
  user.skip_confirmation!
  user.save!
end

# Create a standard member
standard = User.new(
    #name:       'Standard User',
    email:      'standard@example.com',
    password:   'helloworld',
    role:       'standard'
)
standard.skip_confirmation!
standard.save!

# Create a premium member
premium = User.new(
    #name:       'Premium User',
    email:      'premium@example.com',
    password:   'helloworld',
    role:       'premium'
)
premium.skip_confirmation!
premium.save!

# Create an admin
admin = User.new(
    #name:       'Admin User',
    email:      'admin@example.com',
    password:   'helloworld',
    role:       'admin'
)
admin.skip_confirmation!
admin.save!

# Create Wikis
50.times do
   Wiki.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph,
     user:   User.all.sample,
     private: false,
     created_at: Faker::Date.between(14.days.ago, 7.days.ago),
     updated_at: Faker::Date.between(6.days.ago, Date.today)
   )
end
Wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "#{standard.role} user created"
puts "#{premium.role} user created"
puts "#{admin.role} user created"
