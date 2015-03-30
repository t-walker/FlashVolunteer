# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   Mayor.create(:name => 'Daley', :city => cities.first)

require "#{File.dirname(__FILE__)}/seeds_helper.rb"

Role.delete_all()
Role.create([
  { name: 'SuperAdmin' },
  { name: 'Volunteer' },
])

User.delete_all()
email = ENV['ADMIN_USERNAME'] && ENV['ADMIN_USERNAME'].dup
password = ENV['ADMIN_PASSWORD'] && ENV['ADMIN_PASSWORD'].dup
password ||= 'password'
admin = User.find_or_create_by_email(:email => email || 'admin@localhost.com', :password => password, :password_confirmation => password, :name => 'Admin')
admin.roles << Role.find_by_name('SuperAdmin')

Skill.delete_all()
Skill.create([
{ name: 'Advocacy | Human Rights',           offset: 0 },
{ name: 'Animals',                           offset: 1 },
{ name: 'Anti-Bullying',                     offset: 2 },
{ name: 'Arts | Culture',                    offset: 3 },
{ name: 'Children | Families',               offset: 4 },
{ name: 'Community',                         offset: 5 },
{ name: 'Computers | Technology',            offset: 6 },
{ name: 'Disabilities | Elderly',            offset: 7 },
{ name: 'Disaster Relief',                   offset: 8 },
{ name: 'Education | Literacy',              offset: 9 },
{ name: 'Environment',                       offset: 10 },
{ name: 'GLBT',                              offset: 11 },
{ name: 'Health | Medicine',                 offset: 12 },
{ name: 'Homelessness | Housing',            offset: 13 },
{ name: 'Hunger',                            offset: 14 },
{ name: 'Immigrants | Refugees',             offset: 15 },
{ name: 'Justice | Legal',                   offset: 16 },
{ name: 'Media | Broadcasting',              offset: 17 },
{ name: 'Politics',                          offset: 18 },
{ name: 'Sports | Recreation',               offset: 19 }
])

Neighborhood.delete_all()

%w(wa or il in).each do |state|
  contents = File.read("#{Rails.root}/db/data/neighborhoods/#{state}.json")
  geom = RGeo::GeoJSON.decode(contents, :json_parser => :json)
  geom.each do |neighborhood|
    state = neighborhood.properties['STATE']
    county = neighborhood.properties['COUNTY']
    city = neighborhood.properties['CITY']
    name = neighborhood.properties['NAME']
    neighborhood = Neighborhood.create(:state => state, :county => county, :city => city, :name => name, :region => neighborhood.geometry)
    ActiveRecord::Base.connection.execute("UPDATE neighborhoods SET center=Centroid(region) WHERE id=#{neighborhood.id}")
  end
end

Notification.delete_all()
Notification.create([
  {name: 'prop_received', description: 'Props from a grateful Flash Volunteer'},
  {name: 'new_event_attendee', description: "Someone signs up for an event I'm coordinating"},
  {name: 'organizer_broadcast', description: "An event organizer wishes to contact me about an event I'm signed up for"}
])

$sample_event_names = [
  {name: 'Fremont Fair'},
  {name: 'Treehouse Wearhouse'},
  {name: 'Collecting New & Gently Used Items for Benefit Sale'},
  {name: 'Kirkland Boys & Girls Club Summer Dreams Auction'},
  {name: 'Hopelink 40th Anniversary Gala'},
  {name: 'Mercer Island Farmers Market Benefit Dinner - For the LOVE of Food'},
  {name: 'Boys & Girls Club, SMART Girls Program'},
  {name: 'FREE Electronic Recycling with CRISTA Ministries and Friendly Earth'},
  {name: 'North King County Little League Mid Season Party'},
  {name: 'Study Zone at the Shoreline Library'},
  {name: 'Neighborhood House annual breakfast'},
  {name: 'Stuff the Bus at Street Fair'},
  {name: 'Flash Volunteer Spring Reception'},
  {name: 'Pioneer Square Spring Clean'},
  {name: 'Seattle Summer Streets - Alki Beach'},
  {name: 'Leaping for Literacy!'},
  {name: 'Rock n Roll Seattle Marathon & Half Marathon benefiting the American Cancer Society'},
  {name: 'Green Seattle Partnership Forest Monitoring Team'},
  {name: 'Furry 5K'},
  {name: 'Fremont Solstice Parade seeks Volunteers for Saturday, June 16th'},
  {name: 'South Seattle Summer Meal Volunteer Event'},
  {name: 'Celebrate Little Saigon'},
  {name: 'Des Moines Summer Meal Volunteer Opportunity'},
  {name: 'Federal Way Summer Meals Volunteer Opportunity'},
  {name: 'Big Time Weeding'},
  {name: 'More Maintenance on the Burke'},
  {name: 'Youth Engagement Training'},
  {name: 'Yet More Weeding'},
  {name: 'Cleaning up the Burke'},
  {name: 'Mulching galore!'},
  {name: 'Fun with wood chips'},
  {name: 'March with Pride!'},
  {name: 'Clean up Alki Beach Park'},
  {name: 'ESL classes and Citizenship Tutoring'},
  {name: 'Help Out At The Wedgwood Arts Fest!'},
  {name: 'Help Provide Food For Those In Need!'},
  {name: "A Summer Evening At Magnuson Children's Garden"},
  {name: 'Happily Lend A Hand To The Heron Habitat Helpers'},
  {name: 'Volunteer At The Braille Library'},
  {name: 'Fight Hunger At The Family 4th!'},
  {name: 'Help Provide Food For Those In Need!'},
  {name: 'Have A Laptop? Want To Help Teens? Work With CHOICES!'},
  {name: 'Stuff The Bus Takes On Seward Park'},
  {name: 'Fourth on the Plateau'},
  {name: 'Volunteer at Sammamish Landing'},
  {name: 'Summer Meals Prep'},
  {name: 'Bridge To Basics Call Nights: Connect Community Members With Important Benefits!'},
  {name: 'Start Your Day With Yoga For Hope!'},
  {name: '2012 BAM ARTS fair!'},
  {name: '5K Run In Safeco Field'},
  {name: 'Outdoor Cinema @ Magnuson & Marymoor Parks'},
  {name: 'Be a Summer Camp Volunteer'},
  {name: 'Redmond Bicycle Derby Days'},
  {name: 'Outdoor Work Party Campus Ground Clean-up!'},
  {name: 'Garden Of Goo - Native Plant Nursery'},
  {name: 'Ivy and blackberry removal'},
  {name: 'Clean Up Forest Remnant Zone'},
  {name: 'Weed a planted area'},
  {name: 'Kiwanis Wildlife Corridor'},
  {name: 'Wood chips-adding buld to my cellium diets'}
]

# Test data for development
if Rails.env.development?
    Random.new
    Org.delete_all()
    Event.delete_all()
    Affiliate.delete_all()
    Hub.delete_all()

  config = YAML::load(ERB.new(File.read("#{Rails.root}/db/seed.yml")).result)

  users = User.create(config['users'])
  users.each do |u|
    u.neighborhood = Neighborhood.all.sample
    u.save
  end

  orgs = Org.create(config['orgs'])
  orgs.each do |o|
    o.admins = User.where('Type != ?', :Org).sample(Random.rand(1..3))
    o.neighborhood = Neighborhood.all.sample
    o.save
  end


  Affiliate.create(config['affiliates'])

  config['user_orgs'].each do |relation|
    user = User.find_by_email(relation['email'])
    org = Org.find_by_email(relation['org_email'])
    unless org.admins.include?(user)
      org.admins << user
    end
    org.save
  end

  config['user_affiliations'].each do |relation|
    affiliation = UserAffiliation.new()
    affiliation.user = User.find_by_email(relation['email'])
    affiliation.affiliate = Affiliate.find_by_name(relation['affiliate'])
    affiliation.moderator = relation['moderator']
    affiliation.save
  end

  hubs = YAML::load(ERB.new(File.read("#{Rails.root}/db/hubs.yml")).result)
  Hub.create(hubs['hubs'])

  $sample_event_names.each do |e|
    event = Event.new
    event.name = e[:name]
    neighborhood_info = random_neighborhood
    possible_participants = User.all
    possible_org_owners = Org.all
    event.start = Time.now + about_a_month
    event.user = possible_org_owners.sample
    event.end = event.start + Random.rand(1..5)
    event.description = random_description
    event.participants = possible_participants.sample(Random.rand(1..5))
    event.skills = Skill.all.sample(Random.rand(1..10))
    event.neighborhood = Neighborhood.contains(neighborhood_info['WKT'])
    event.zip = neighborhood_info['zip']
    event.street = neighborhood_info['address']
    event.featured = true if Random.rand(1..10) > 9
    puts neighborhood_info['WKT']
    puts Neighborhood.contains(neighborhood_info['WKT'])
    event.save!
  end
end
