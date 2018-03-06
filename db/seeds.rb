# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create(email: "user1@test.com",password: '12345678',password_confirmation: '12345678')
location1 = Location.create(user_id:1,public: true,lonlat:"POINT(#{114.2219923} #{22.3129115})")
user2 = User.create(email: "user2@test.com",password: "12345678",password_confirmation: '12345678')
location1 = Location.create(user_id:2,public: true,lonlat:"POINT(#{114.2219923} #{22.3129115})")
location3 =  Location.create(user_id:1,public: false,lonlat:"POINT(#{112.2219923} #{23.3129115})",to: "user2@test.com")