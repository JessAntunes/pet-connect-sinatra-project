Shelter.destroy_all
Animal.destroy_all

5.times do 
    Shelter.create!(
        password: "password123",
        email: Faker::Internet.safe_email,
        shelter_name: Faker::Movies::LordOfTheRings.location + " Animal Shelter",
        phone: Faker::PhoneNumber.cell_phone,
        hours: ['8am to 5pm', '9am to 7pm', '10am to 9pm'].sample,
        location: Faker::Address.full_address

    )
end

200.times do 
    Animal.create!(
        name: Faker::TvShows::BojackHorseman.character,
        species: Faker::Creature::Animal.name,
        gender: ['male', 'female'].sample,
        age: ['baby', 'young', 'adult', 'senior'].sample,
        temperment: ['mild', 'playful', 'anxious'].sample,
        kid_friendly: [true, false].sample,
        pet_friendly: [true, false].sample,
        added: Faker::Date.between(from: '2020-02-23', to: '2021-04-13'),
        shelter_id: rand(1..5)
    )

end

puts "Seeded and Succeeded"