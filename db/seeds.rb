# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Link.create(
  :text => "About Us",
  :link => "/"
)

Link.create(
  :text => "Current Show",
  :link => "/shows/current"
)

Link.create(
  :text => "Past Productions",
  :link => "/shows"
)

Link.create(
  :text => "Contact Us",
  :link => "/contact"
)

Person.create(
  :name => 'admin',
  :email => 'james.kiesel@gmail.com',
  :salt => 'd6kgriovGzcg',
  :pass_hash => '34b20552647118053f991800bace92820149f132c0e4605874f7b9570af7450b'
)