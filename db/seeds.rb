# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |uN|
    User.create(username: "TestUser#{uN}")
end

 def get_random_string(length=5)
    source=("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a + ["_","-","."]
    key=""
    length.times{ key += source[rand(source.size)].to_s }
    return key
end

10.times do |uN|
    20.times do |aN|
        Artwork.create(title: "Test Art #{aN}", image_url: get_random_string, artist_id: uN)
    end
end

500.times do |aN|
    ArtworkShare.create(artwork_id: rand(1..200), viewer_id: rand(1..10))
end
    
      