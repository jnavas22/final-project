desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do
  require "date"

  first_names = ["Josselyn", "Sarah", "Mari", "Antonio", "Diego", "Bruce", "Sheila"]
  last_names = ["Navas", "Kwon", "Mirasol", "Cruz", "Quesada", "Navas", "Bolanos"]
  emails = ["josselyn@example.com", "sarah@example.com", "mari@example.com", "antonio@example.com", "diego@example.com", "bruce@example.com", "sheila@example.com"]
  bool = [true, false]
  from_cities = ["Chicago", "Miami", "Boston", "Dallas", "Los Angeles", "Miami", "Chicago"]
  to_cities = ["New York City", "New York", "New York City", "Chicago", "Miami", "Seattle", "Seattle"]
  genders = ["Female", "Female", "Female", "Male", "Male", "Male", "Female"]
  universities = ["University of Chicago", "Indiana University", "Northwestern University", "Yale University"]
  date1 = Date.parse("2022-06-03")
  date2 = Date.parse("2022-07-03")
  date3 = Date.parse("2022-08-03")
  dates = [date1, date2, date3]
  person_types = ["Morning person", "Night owl"]
  max_rents = [1400, 2000, 900, 1000, 1500]
  roommate_numbers = [1, 2, 3, 4]
  bathroom_numbers = [1, 2, 3]

  7.times do |count|
    user = User.new
    user.email = emails.at(count)
    user.first_name = first_names.at(count)
    user.last_name = last_names.at(count)
    user.password = "password"
    user.gender = genders.at(count)
    user.university = universities.sample
    user.from_city = from_cities.at(count)
    user.to_city = to_cities.at(count)
    user.movedate = dates.sample
    user.save
  end

  id_1 = User.where(:first_name => "Josselyn").at(0).id
  id_2 = User.where(:first_name => "Sarah").at(0).id
  id_3 = User.where(:first_name => "Mari").at(0).id
  id_4 = User.where(:first_name => "Antonio").at(0).id
  id_5 = User.where(:first_name => "Diego").at(0).id
  id_6 = User.where(:first_name => "Bruce").at(0).id
  id_7 = User.where(:first_name => "Sheila").at(0).id

  ids = [id_1, id_2, id_3, id_4, id_5, id_6, id_7]

  josselyn = File.open("#{Rails.root.to_s}/public/uploads/images/josselyn.jpg")
  sarah = File.open("#{Rails.root.to_s}/public/uploads/images/sarah.jpg")
  mari = File.open("#{Rails.root.to_s}/public/uploads/images/mari.jpg")
  antonio = File.open("#{Rails.root.to_s}/public/uploads/images/antonio.jpg")
  diego = File.open("#{Rails.root.to_s}/public/uploads/images/diego.jpg")
  bruce = File.open("#{Rails.root.to_s}/public/uploads/images/bruce.jpg")
  sheila = File.open("#{Rails.root.to_s}/public/uploads/images/sheila.jpg")
  pictures = [josselyn, sarah, mari, antonio, diego, bruce, sheila]

  7.times do |count|
    preference = Preference.new
    preference.pets = bool.sample
    preference.max_rent = max_rents.sample
    preference.person_type = person_types.sample
    preference.laundry = bool.sample
    preference.doorman = bool.sample
    preference.roommate_num = roommate_numbers.sample
    preference.bathroom_num = bathroom_numbers.sample
    preference.elevator = bool.sample
    preference.air_conditioner = bool.sample
    preference.transportation = bool.sample
    preference.picture = pictures.at(count)
    preference.user_id = ids.at(count)
    preference.save
  end
  p "Added #{User.count} Users"
  p "Added #{Preference.count} preferences"
end
