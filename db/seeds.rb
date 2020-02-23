# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



5.times do |i|

  artist = Artist.create(name: "artist-#{i}")
  billboard = Billboard.create(name: "billboard-#{i}")
  song = artist.songs.create(name: "song-#{i}")

#   # add created movie to 
#   # @theater.movies << movies.find(params[:movies_id]) in custom route
#   # theater.movies << movie   

#   ## movie doesn't have to be assiocated with theater lets see how to remove it
#   # if(i == 1)
#   #   # Movie.find(params[:movie_id]).update(theater_id: nil)
#   #   theater.movies[0].update(theater_id: nil)
#   # end
end

songs = Song.all.where(billboard_id: nil)
puts "songs with no billboard #{songs.size}"



# require 'faker'
#   jewelry = Department.create(name: 'Jewelry', category:'Jewelry and Perfume', floor: "First Floor - Central")
#   5.times do
#     jewelry.items.create(name: Faker::Commerce.product_name, 
#                         quantity: rand(5...75), 
#                         description: Faker::Quote.famous_last_words)
#             # 7.times do item.comments.create(
#             #             subject: Faker::FunnyName.name,
#             #             review: Faker::Quote.most_interesting_man_in_the_world,
#             #             rating: rand(1..5))
#             # end
#   end 