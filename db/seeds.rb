# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

puts "Cleaning database..."
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

puts "Creating movies..."

url = "https://tmdb.lewagon.com/movie/top_rated"
apihome = "https://image.tmdb.org/t/p/w500"
user_serialized = URI.open(url).read
movies = JSON.parse(user_serialized)

movies["results"].each do |data|
  movie = Movie.create!({title: data["title"], overview: data["overview"], poster_url: apihome + data["poster_path"], rating: data["vote_average"]})
  puts "Created #{movie.title}"
end

puts "Creating list..."

list = List.create!({name: "Favorites"})
puts "Created #{list.name}"

puts "Finished!"