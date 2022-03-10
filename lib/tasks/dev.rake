desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do
  first_names = ["Josselyn", "Sarah", "Mari", "William", "Diego"]
  last_names = ["Navas", "Kwon", "Mirasol", "Garcia", "Quesada"]
  emails = ["josselyn@example.com", "sarah@example.com", "mari@example.com", "william@example.com", "diego@example.com"]
  bool = [true, false]
  from_cities = ["Chicago", "Chicago", "Chicago", "Dallas", "Chicago"]
  to_cities = ["New York City", "Los Angeles", "New York City", "Chicago", "Miami"]
  genders = ["Female", "Female", "Female", "Male", "Male"]
  universities = ["University of Chicago", "Indiana University", "Northwestern University"]


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
    user.save
  end
  p "Added #{User.count} Users"
end
