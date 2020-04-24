# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.delete_all
User.delete_all
Review.delete_all

100.times do 
    created_at = Faker::Date.backward(days: 365 * 5)
    p = Product.create(
            title: Faker::Device.model_name,
            description: Faker::ChuckNorris.fact,
            price: Faker::Number.decimal(l_digits: 2)     
    )
    if p.valid? 
        p.reviews = rand(0..15).times.map do 
            Review.new(
                body: Faker::GreekPhilosophers.quote,
                rating: rand(1..5) 
            
            )
        end
    end
end


100.times do 
    created_at = Faker::Date.backward(days: 365 * 5)
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email  
    )
end

product = Product.all
user = User.all
review = Review.all

puts Cowsay.say("Generated #{product.count} products", :dragon)
puts Cowsay.say("Generated #{user.count} users", :frogs)
puts Cowsay.say("Generated #{review.count} reviews", :tux)