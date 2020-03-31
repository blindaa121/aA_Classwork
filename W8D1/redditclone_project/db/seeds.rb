# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
user = User.create!(username: "bryan2", password: "password")

Sub.destroy_all 
sub = Sub.create!(title: "App Academy Drama", description: "Staff Secrets", moderator_id: user.id)
sub2 = Sub.create!(title: "Dogs", description: "better than cats", moderator_id: user.id)
