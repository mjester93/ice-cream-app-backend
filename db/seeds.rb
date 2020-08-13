# Creating Users
5.times do 
    User.create({username: Faker::Internet.unique.username, location: 'Washington, DC'})
end

michael = User.create({username: 'michael', location: 'Washington, DC'})
esther = User.create({username: 'esther', location: 'Washington, DC'})

# Creating Ice Cream Flavors
10.times do 
    IceCream.create({flavor: Faker::Dessert.unique.flavor, calories: rand(100...200)})
end

# Creating Stores (name, location, lat, lon)

Store.create({name: "Jeni's Splendid Ice Creams", location: 'Washington, DC', latitude: 38.916372, longitude: -77.031662})
Store.create({name: "Presidential Scoops", location: "Washington, DC", latitude: 38.898196, longitude: -77.033031})
Store.create({name: "Ice Cream Jubilee", location: "Washington, DC", latitude: 38.873667, longitude: -77.001386})
Store.create({name: "Bon Matcha", location: "Washington, DC", latitude: 38.901166, longitude: -77.044741})
Store.create({name: "Nicecream", location: "Washington, DC", latitude: 38.923176, longitude: -77.042345})
Store.create({name: "Thomas Sweet", location: "Washington, DC", latitude: 38.909112, longitude: -77.064073 })