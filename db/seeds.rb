# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(email: 'test1@test.com', password: '12345678')
user2 = User.create(email: 'test2@test.com', password: '12345678')

Post.create(user: user1, content: 'Great weather today!')
Post.create(user: user1, content: 'Beautiful Beach!')
Post.create(user: user1, content: 'Sydney is hot.')
Post.create(user: user1, content: 'Yay Rails!')
Post.create(user: user2, content: 'PHP is the best!')
Post.create(user: user2, content: 'Let\'s go drinking')
Post.create(user: user2, content: 'Scaffold is fun!')
