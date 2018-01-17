# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AWS_URL = 'aws.s3.com/'

# USERS
User.create(username: "Dakota", password: "password", first_name: "Dakota", last_name: "Lillie", email: "bewguy101@gmail.com")
# 2.times do
#   user = User.new(
#     username: Faker::Internet.user_name,
#     password: "password",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.free_email
#   )
#   user.save
# end

# # LIBRARIES
# 15.times do
#   instrument = Faker::Music.instrument
#   library = Library.new(
#     name: "#{instrument} samples v.#{Faker::Number.between(1, 5)}",
#     artwork_url: "#{Faker::Internet.url("#{AWS_URL}#{instrument}", '.jpg')}"
#   )
#   user = User.order("RANDOM()").first
#   user.libraries.push(library)
#   library.save
# end

# # SAMPLES
# 500.times do
#   instrument = Faker::Music.instrument
#   number = Faker::Number.between(1, 99)
#   types = ["loop", "one-shot"]
#   genres = ["rock", "soul", "dubstep", "trap", "chill", "mega-chill", "hyphy"]
#   sample = Sample.new(
#     name: "#{instrument}_#{number}",
#     url: "#{Faker::Internet.url("#{AWS_URL}#{instrument}", '.wav')}",
#     preview_url: "#{Faker::Internet.url("#{AWS_URL}#{instrument}", '.mp3')}",
#     instrument: instrument,
#     sample_type: types[rand(2)],
#     genre: genres[rand(genres.length)]
#   )
#   sample.tempo = 70 + rand(90) if sample.sample_type == "loop"
#   sample.key = Faker::Music.key if sample.sample_type == "loop"
#   user = User.order("RANDOM()").first
#   library = Library.order("RANDOM()").first
#   user.samples.push(sample)
#   library.samples.push(sample)
#   sample.save
# end

# # TAGS
# 15.times do
#   tag = Tag.new(
#     name: Faker::Color.color_name
#   )
#   30.times do
#     sample = Sample.order("RANDOM()").first
#     sample.tags.push(tag)
#   end
# end

# 12.times do
#   folder = Folder.new(name: "folder_#{rand(100)}")
#   if Folder.count > 0 && (1 + rand(100)) > 70
#     parent_folder = Folder.order("RANDOM()").first
#     folder.parent_folder = parent_folder
#     folder.users.push(parent_folder.users[0])
#   else
#     folder.users.push(User.order("RANDOM()").first)
#   end
#   6.times do
#     sample = Sample.order("RANDOM()").first
#     folder.samples.push(sample)
#   end
#   folder.save
# end

