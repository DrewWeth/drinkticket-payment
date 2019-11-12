# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Item.create(name:'Beer', desc:'One cold brew', price: 3.50, picture_url: 'https://static.vinepair.com/wp-content/uploads/2019/08/weasked10_header-2.jpg')


u1 = User.create :email => "admin@example.com", :password => "test123", is_admin: true
g1 = Group.create name: 'Test Group'
u1.groups << g1
i1 = Item.create name:'Test item 1', price: 42, group_id: g1.id, picture_url: "https://static.vinepair.com/wp-content/uploads/2019/08/weasked10_header-2.jpg"
i2 = Item.create name:'Test item 2', price: 3, group_id: g1.id, picture_url: "https://images-na.ssl-images-amazon.com/images/I/51uJdR27f7L.jpg"


u2 = User.create :email => "user@example.com", :password => "test123"
u2.groups << g1