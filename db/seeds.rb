# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 josh = HomeOwner.create!(
    firstname: 'Josh',
    lastname: 'Restuccio',
    email: 'jstoosh84@gmail.com',
    phone: '901-555-5555'
    )

ad1 = Address.create!(
    name: 859,
    street: 'Harbor Bend Rd',
    city: 'Memphis',
    state: 'TN'
    )
josh.addresses.push(ad1)
josh.save!

IssueCategory.create!(
	name: "Test"
	)

kevin = User.create!(email: "kevin@memphis.edu", password: "password",
                     password_confirmation: "password")
