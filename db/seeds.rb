# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do
  Player.create(name: Faker::HarryPotter.character,
    speed: rand(10),
    accuracy: rand(100),
    price: rand(15)
  )
end


20.times do
  User.create(
    name: Faker::Name.name,
    username: Faker::StarWars.character.split.join('').downcase,
    password: 'password'
  )
end

3.times do
  league = League.create(
    name: Faker::LordOfTheRings.location
  )
  10.times do
    Team.create(
      name: Faker::Team.name,
      user_id: User.all.sample.id,
      league_id: league.id
    )
  end
end
