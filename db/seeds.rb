# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Item.create(name:'Beer', desc:'One cold brew', price: 3.50, picture_url: 'https://static.vinepair.com/wp-content/uploads/2019/08/weasked10_header-2.jpg')


u1 = User.create :name => "Test user", :email => "test@example.com", :password => "test"
g1 = Group.create name: 'Test Group'
u1.groups << g1
i1 = Item.create name:'Test item 1', price: 50, group_id: g1.id
i2 = Item.create name:'Test item 2', price: 42, group_id: g1.id
