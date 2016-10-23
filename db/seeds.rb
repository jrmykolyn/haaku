# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = [
	{ :name => 'Jeremy Kolyn', :email => 'jeremy.kolyn@test.com', :sex => 'm', :role => 'instructor' },
	{ :name => 'John Smith', :email => 'john.smith@test.com', :sex => 'm', :role => 'student' },
	{ :name => 'Jane Doe', :email => 'jane.doe@test.com', :sex => 'f', :role => 'student' }
]

users.each do |user|
	User.create( user )
end
