desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do

  require "date"

  first_names = ["Josselyn", "Sarah", "Mari", "Antonio", "Diego"]
  last_names = ["Navas", "Kwon", "Mirasol", "Cruz", "Quesada"]
  emails = ["josselyn@example.com", "sarah@example.com", "mari@example.com", "antonio@example.com", "diego@example.com"]
  bool = [true, false]
  from_cities = ["Chicago", "Chicago", "Chicago", "Dallas", "Chicago"]
  to_cities = ["New York City", "Los Angeles", "New York City", "Chicago", "Miami"]
  genders = ["Female", "Female", "Female", "Male", "Male"]
  universities = ["University of Chicago", "Indiana University", "Northwestern University"]
  date1 = Date.parse("2022-06-03") 
  date2 = Date.parse("2022-07-03")
  date3 = Date.parse("2022-08-03")  
  dates = [date1, date2, date3]
  5.times do |count|
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

  5.times do 
    
  p "Added #{User.count} Users"
end
