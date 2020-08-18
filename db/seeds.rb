# Destroying old data
User.destroy_all
IceCream.destroy_all
Store.destroy_all
IceCreamStore.destroy_all
Review.destroy_all
FavoriteStore.destroy_all


# Creating Users
5.times do 
    User.create(username: Faker::Internet.unique.username, location: 'Washington, DC', password: 'password')
end

michael = User.create(username: 'michael', location: 'Washington, DC', password: 'password')
esther = User.create(username: 'esther', location: 'Washington, DC', password: 'password')

# Creating Ice Cream Flavors
10.times do 
    IceCream.create({flavor: Faker::Dessert.unique.flavor, calories: rand(100...200)})
end

brambleberry = IceCream.create({flavor: "Brambleberry Crisp", calories: 320})
goatcheese = IceCream.create({flavor: "Goat Cheese with Red Cherries", calories: 320})
pistachhoney = IceCream.create({flavor: "Pistachio & Honey", calories: 320})
matcha = IceCream.create({flavor: "Matcha", calories: 150})
hojicha = IceCream.create({flavor: "Hojicha", calories: 125})
vietcoffee = IceCream.create({flavor: "Vietnamese Coffee", calories: 190})
pboreo = IceCream.create({flavor: "Peanut Butter Oreo", calories: 350})
mintchip = IceCream.create({flavor: "Mint Chocolate Chip", calories: 280})
cookiesncream = IceCream.create({flavor: "Cookies & Cream", calories: 290})
vanilla = IceCream.create({flavor: "Vanilla", calories: 200})


# Creating Stores (name, location, lat, lon)

jenis = Store.create({name: "Jeni's Splendid Ice Creams", location: 'Washington, DC', latitude: 38.916372, longitude: -77.031662})
Store.create({name: "Presidential Scoops", location: "Washington, DC", latitude: 38.898196, longitude: -77.033031})
jubilee = Store.create({name: "Ice Cream Jubilee", location: "Washington, DC", latitude: 38.873667, longitude: -77.001386})
bonmatcha = Store.create({name: "Bon Matcha", location: "Washington, DC", latitude: 38.901166, longitude: -77.044741})
Store.create({name: "Nicecream", location: "Washington, DC", latitude: 38.923176, longitude: -77.042345})
Store.create({name: "Thomas Sweet", location: "Washington, DC", latitude: 38.909112, longitude: -77.064073 })

#BMORE
Store.create({name: "The Charmery", location: "Baltimore, MD", latitude: 39.331097, longitude: -76.629548})
bmore = Store.create({name: "BMore Licks", location: "Baltimore, MD", latitude: 39.285860, longitude: -76.581577})
Store.create({name: "Taharka Brothers", location: "Baltimore, MD", latitude: 39.284197, longitude: -76.593368})
pitango = Store.create({name: "Pitango Gelato", location: "Baltimore, MD", latitude: 39.282389, longitude: -76.593708})

# Adding Three Ice Creams to each store
Store.all.each do |store|
    3.times do 
        IceCreamStore.create({store_id: store.id, ice_cream_id: IceCream.all.sample.id})
    end
end
IceCreamStore.create({store_id: jenis.id, ice_cream_id: brambleberry.id})
IceCreamStore.create({store_id: jenis.id, ice_cream_id: goatcheese.id})
IceCreamStore.create({store_id: jenis.id, ice_cream_id: pistachhoney.id})
IceCreamStore.create({store_id: bonmatcha.id, ice_cream_id: matcha.id})
IceCreamStore.create({store_id: bonmatcha.id, ice_cream_id: hojicha.id})
IceCreamStore.create({store_id: bonmatcha.id, ice_cream_id: vietcoffee.id})
IceCreamStore.create({store_id: jubilee.id, ice_cream_id: matcha.id})
IceCreamStore.create({store_id: jubilee.id, ice_cream_id: vietcoffee.id})
IceCreamStore.create({store_id: pitango.id, ice_cream_id: hojicha.id})
IceCreamStore.create({store_id: pitango.id, ice_cream_id: pistachhoney.id})
IceCreamStore.create({store_id: bmore.id, ice_cream_id: pboreo.id})
IceCreamStore.create({store_id: bmore.id, ice_cream_id: mintchip.id})
IceCreamStore.create({store_id: bmore.id, ice_cream_id: cookiesncream.id})
IceCreamStore.create({store_id: bmore.id, ice_cream_id: vanilla.id})

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