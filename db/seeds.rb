# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
 
 # To use this file:
 # rake db:reset
 
50.times do
  User.create!(
    # name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Internet.password(8, 15)
  )
end
users = User.all

#Create wikis
100.times do
  Wiki.create!(
    user:     users.sample,
    title:    Faker::Lorem.word + " " + Faker::Lorem.word,
    body:     Faker::Lorem.paragraph,
    private:  false
  )
end
wikis = Wiki.all  

#Generate data for Henry
User.first.update_attributes!(
  # name:     'Henry Schaumburger',
  email:    'per4mnce@gmail.com',
  password: 'password'
)

#Generate wikis for henry
5.times do
  Wiki.create!(
    user:     User.first,
    title:    Faker::Lorem.word + " " + Faker::Lorem.word,
    body:     Faker::Lorem.paragraph,
    private:  false
    # created_at: Faker::Time.between(100.days.ago, Time.now, :all)
  )
end

puts "Seed finished"
puts "#{User.count} users created!"
puts "#{Wiki.count} Wikis created!"
