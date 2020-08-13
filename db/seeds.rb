# Creating Users
5.times do 
    User.create({name: Faker::Internet.unique.username, location: 'Washington, DC'})
end

michael = User.create({name: 'michael', location: 'Washington, DC'})
esther = User.create({name: 'esther', location: 'Washington, DC'})

