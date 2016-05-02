# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 josh = HomeOwner.create!(
    firstname: 'No',
    lastname: 'Homeowner',
    email: '',
    phone: '',    
    )

 josh = HomeOwner.create!(
    firstname: 'Josh',
    lastname: 'Restuccio',
    email: 'jstoosh84@gmail.com',
    phone: '901-555-5555',    
    )

 stephen = HomeOwner.create!(

    firstname: 'Stephen',
    lastname: 'Young',
    email: 'sYoung@gmail.com',
    phone: '901-555-5555'
    )

#import all addresses
Address.import('./misc/HOA_masterlist.ods')


# ad1 = Address.create!([
#     {number: 859,
#     street: 'Harbor Bend Rd',
#     city: 'Memphis',
#     state: 'TN'},

#     {number: 1400,
#     street: 'East Island Pl',
#     city: 'Memphis',
#     state: 'TN'},

#     {number: 1033,
#     street: 'East Island Pl',
#     city: 'Memphis',
#     state: 'TN'},

#     {number: 1274,
#     street: 'Fleets Dr',
#     city: 'Memphis',
#     state: 'TN'},

#     {number: 1445,
#     street: 'Island Town Cv',
#     city: 'Memphis',
#     state: 'TN'},

#     {number: 65,
#     street: 'Riverwalk Pl',
#     city: 'Memphis',
#     state: 'TN'},

#     {number: 3615,
#     street: 'Norriswood Ave',
#     city: 'Memphis',
#     state: 'TN'},

#     {number: 416,
#     street: 'Life Sciences Bldg',
#     city: 'Memphis',
#     state: 'TN'},

#     {number: 217,
#     street: 'FedEx Institute of Technology',
#     city: 'Memphis',
#     state: 'TN'},

#     {number: 303,
#     street: 'Dunn Hall',
#     city: 'Memphis',
#     state: 'TN'}

# ])



#josh.addresses.push(ad1[0])
#josh.addresses.push(ad1[1])
#stephen.addresses.push(ad1[2])
#stephen.addresses.push(ad1[3])
#stephen.addresses.push(ad1[4])
#josh.addresses.push(ad1[5])
#josh.save!
#stephen.save!

#stephen.addresses.push(ad1[3])
#stephen.save!

is1 = IssueCategory.create!(
    [{name: 'Lawn'},
    {name: 'Paint'},
    {name: 'Wood'},
    {name: 'Trash'}
    ])

IssueStatusCategory.create!(
    [{name: 'Letter 1'},
    {name: 'Letter 2'},
    {name: 'Letter 3'},
    {name: 'Fine'},
    {name: 'Resolved'}
    ])


kevin = User.create!(email: "kevin@memphis.edu", password: "password",
                     password_confirmation: "password", isadmin: 1)

joshU = User.create!(email: "jstoosh84@gmail.com", password: "password", password_confirmation: "password", isadmin: 1)

moo = User.create!(email: "moo@gmail.com", password: "password",
                    password_confirmation: "password", isadmin: 1)

nonAdmin = User.create!(email: "nonAdmin@gmail.com", password: "password",
                    password_confirmation: "password", isadmin: 0)

i1 = Issue.create!([
    {
    date: DateTime.parse("26/2/2016 8:00"),
    issue_status_category_id: 1,
    note: 'Rotting wood on exterior of home. West side.',
    address_id: 2,
    home_owner_id: 1,    
    user_id: 2,
    issue_category_id: 3,
    issue_status_category_id: 1
    } ,

    {
    date: DateTime.parse("25/2/2016 10:00"),
    issue_status_category_id: 2,
    note: 'Peeling paint along the trim. West side.',
    address_id: 1,
    home_owner_id: 2,    
    user_id: 1,
    issue_category_id: 2,
    issue_status_category_id: 2
    } ,

    {
    date: DateTime.parse("21/2/2016 7:30"),
    issue_status_category_id: 5,
    note: 'Trash overflowing.',
    address_id: 4,
    home_owner_id: 2,
    user_id: 1,
    issue_category_id: 4,
    issue_status_category_id: 5
    } 

    ])

