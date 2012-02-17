# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.find_or_create_by(name: 'First User', email: 'user@example.com', password: 'please', password_confirmation: 'please', role: "transmitter")
puts 'New user created: ' << user.name

require 'csv'

puts "creating departements"
CSV.foreach("csv/departements.csv", headers: true) do |row|
  dep = Departement.find_or_create_by(name: row['name'], code_postal: row['cp'])
  puts "new departement created : " << dep.name
end
