# Creating Users
5.times do 
    User.create({username: Faker::Internet.unique.username, location: 'Washington, DC'})
end

michael = User.create({username: 'michael', location: 'Washington, DC'})
esther = User.create({username: 'esther', location: 'Washington, DC'})

10.times do 
    IceCream.create({flavor: Faker::Dessert.unique.flavor, calories: rand(100...200)})
end