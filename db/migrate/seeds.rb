100.times do 
    Shelter.create!(
        password: "password123",
        email: Faker::Internet.safe_email,
        location: Faker::Address.full_address,
        added: Faker::Date.between(from: '2020-02-23', to: '2021-04-13')

    )