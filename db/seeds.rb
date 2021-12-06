# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
        @user = User.create(
                    name: Faker::Movies::StarWars.character,
                    email: "fabiloco@gmail.com",
                    admin: true,
                    password: "123123",
                    password_confirmation: "123123")
        @user.avatar.attach(io: File.open(Rails.root.join('app/assets/images/name.jpg')),
            filename: 'name.jpg')

        @usertwo = User.create(
                name: Faker::Movies::StarWars.character,
                email: "alonso@gmail.com",
                admin: false,
                password: "123123",
                password_confirmation: "123123")
        @usertwo.avatar.attach(io: File.open(Rails.root.join('app/assets/images/unnamed.png')),
        filename: 'unnamed.jpg')

    #publication
    10.times do
        Publication.create(
            score: rand(1..10),
            title: Faker::Movies::StarWars.planet,
            description:Faker::Movies::StarWars.planet,
            value:rand(50000..300000),
            user_id: @user.id
        )
    end
    #quotes
    10.times do
        Quote.create(
            date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
            phone: rand(22222222..44444444),
            message:Faker::Movies::StarWars.planet,
            publication_id:rand(1..10),
            user_id: @usertwo.id
        )
    end
    #coment
    10.times do
        Coment.create(
            content:Faker::Movies::StarWars.planet,
            publication_id:rand(1..10),
            user_id: @usertwo.id
        )
    end
    #category
    10.times do
        Category.create(
            name:Faker::Movies::StarWars.planet,
            category_id:rand(1..10)
        )
    end
