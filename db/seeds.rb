# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

team = Team.create name: 'Lifeguard'

user = User.create username: 'hoff', fullname: 'The Hoff', gitname: 'xtreme-hoff', team: team

Environment.create name:'bikinibottom', om_version: '1.7', image: 'http://i.giphy.com/fm6zj05kZQyv6.gif', iaas: 'aws', ops_mgr_url: "pcf.kitkat.cf-app.com", last_commit_message: 'THE HOFF DEMANDS BIKINI BOTTOM ENVIRONMENT', last_commit_timestamp: Time.zone.now, state: "grounded", user_id: user.id
