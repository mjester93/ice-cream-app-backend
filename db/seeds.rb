# Destroying old data
User.destroy_all
IceCream.destroy_all
Store.destroy_all
IceCreamStore.destroy_all
Review.destroy_all
FavoriteStore.destroy_all


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


# Adding Three Ice Creams to each store
Store.all.each do |store|
    3.times do 
        IceCreamStore.create({store_id: store.id, ice_cream_id: IceCream.all.sample.id})
    end
end


# Adding two reviews for each user
User.all.each do |user|
    Review.create({
        user_id: user.id, 
        store_id: Store.all.sample.id, 
        text: Faker::Quotes::Shakespeare.hamlet_quote,
        rating: rand(1...5)
    })

    FavoriteStore.create({
        user_id: user.id,
        store_id: Store.all.sample.id
    })
end