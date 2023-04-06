# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# # Users

user1 = User.create(name: 'Tsohle', photo: 'https://picsum.photos/200/200', bio: 'Teacher from South Africa.')
user2 = User.create(name: 'Teklay', photo: 'https://picsum.photos/300/300', bio: 'Teacher from Etheopia.')
# # Posts 

post1 = Post.create(author: user1, title: 'Hello', text: 'This is my first post.')
post2 = Post.create(author: user1, title: 'Hello', text: 'This is my first post.')
post3 = Post.create(author: user1, title: 'Hello', text: 'This is my first post.')
post4 = Post.create(author: user1, title: 'Hello', text: 'This is my first post.')
post5 = Post.create(author: user1, title: 'Hello', text: 'This is my first post.')
post6 = Post.create(author: user1, title: 'Hello', text: 'This is my first post.')
post7 = Post.create(author: user1, title: 'Hello', text: 'This is my first post.')

# # Comments

Comment.create(author: user1, post: post1, text: 'Sure. Great reminder, thanks!')
Comment.create(author: user1, post: post1, text: 'So relevant. Keep it up!')
Comment.create(author: user1, post: post1, text: 'Thank you so much!')
Comment.create(author: user1, post: post1, text: 'So smart... Lorem ipsum sit dolor amit.')
Comment.create(author: user1, post: post1, text: 'Sure. Great reminder, thanks!')
Comment.create(author: user1, post: post1, text: 'So relevant. Keep it up!')
Comment.create(author: user1, post: post1, text: 'Thank you so much!')
Comment.create(author: user1, post: post1, text: 'So smart... Lorem ipsum sit dolor amit.')
Comment.create(author: user1, post: post1, text: 'So smart... Lorem ipsum sit dolor amit.')
Comment.create(author: user1, post: post1, text: 'So smart... Lorem ipsum sit dolor amit.')
Comment.create(author: user1, post: post1, text: 'So smart... Lorem ipsum sit dolor amit.')
Comment.create(author: user1, post: post1, text: 'So smart... Lorem ipsum sit dolor amit.')
Comment.create(author: user1, post: post1, text: 'So smart... Lorem ipsum sit dolor amit.')
Comment.create(author: user1, post: post1, text: 'So smart... Lorem ipsum sit dolor amit.')
Comment.create(author: user1, post: post1, text: 'So smart... Lorem ipsum sit dolor amit.')
Comment.create(author: user2, post: post1, text: 'So smart... Lorem ipsum sit dolor amit.')
Comment.create(author: user1, post: post1, text: 'So smart... Lorem ipsum sit dolor amit.')
