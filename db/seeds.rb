# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do
  Player.create(name: Faker::HarryPotter.character)
end

100.times do
  User.create(
    name: Faker::Name.name,
    username: Faker::StarWars.character.split.join('').downcase,
    password: 'password'
  )
end

["Gryffindor", "Hufflepuff", "Ravenclaw", "Slytherin"].each do |name|
  league = League.create(name: name)
  rand(5..14).times do
    Team.create(
      name: "#{Faker::HarryPotter.location} #{Faker::ElderScrolls.creature.pluralize(2)}",
      user_id: User.all.sample.id,
      league_id: league.id
    )
  end
end
2.times do
  Player.all.each do |player|
    TeamPlayer.create(player: player, team: Team.all.sample)
  end
end
