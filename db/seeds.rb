# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


directors_file = Rails.root.join('lib', 'seeds', 'directors.json').to_s
director_hashes = JSON.parse(open(directors_file).read)

Director.destroy_all
director_hashes.each do |director_hash|
  d = Director.new
  d.name = director_hash["name"]
  d.image_url = director_hash["image_url"]
  d.bio = director_hash["bio"]
  d.dob = director_hash["dob"]
  d.save
end
puts "There are now #{Director.count} rows in the directors table."

movies_file = Rails.root.join('lib', 'seeds', 'movies.json').to_s
movie_hashes = JSON.parse(open(movies_file).read)

Movie.destroy_all
movie_hashes.each do |movie_hash|
  m = Movie.new
  m.title = movie_hash["title"]
  m.year = movie_hash["year"]
  m.duration = movie_hash["duration"]
  m.description = movie_hash["description"]
  m.image_url = movie_hash["image_url"]
  d = Director.find_by_name(movie_hash["director"])
  m.director_id = d.id if d.present?
  m.save
end
puts "There are now #{Movie.count} rows in the movies table."

actors_file = Rails.root.join('lib', 'seeds', 'actors.json').to_s
actor_hashes = JSON.parse(open(actors_file).read)

Actor.destroy_all
actor_hashes.each do |actor_hash|
  a = Actor.new
  a.name = actor_hash["name"]
  a.image_url = actor_hash["image_url"]
  a.bio = actor_hash["bio"]
  a.dob = actor_hash["dob"]
  a.save
end
puts "There are now #{Actor.count} rows in the actors table."


roles_file = Rails.root.join('lib', 'seeds', 'roles.json').to_s
role_hashes = JSON.parse(open(roles_file).read)

Role.destroy_all
role_hashes.each do |role_hash|
  r = Role.new
  r.character_name = role_hash["character_name"]
  m = Movie.find_by_title(role_hash["movie"])
  a = Actor.find_by_name(role_hash["actor"])
  r.movie_id = m.id if m.present?
  r.actor_id = a.id if a.present?
  r.save
end
puts "There are now #{Role.count} rows in the roles table."
