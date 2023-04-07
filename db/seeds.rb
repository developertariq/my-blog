# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# # Users


user1 = User.create(name: 'Ellon', photo: 'https://picsum.photos/300/200', bio: 'Software Engineer from Nigeria')
user2 = User.create(name: 'Hassan', photo: 'https://picsum.photos/200/300', bio: 'Software Engineer from Morocco')
# # Posts 

post1 = Post.create(author: user2, title: 'First post', text: 'This is my first post.')
post2 = Post.create(author: user2, title: 'Second post', text: 'This is my second post.')
post3 = Post.create(author: user2, title: 'Third post', text: 'This is my first post.')
post4 = Post.create(author: user2, title: 'New post', text: 'This is my first post.')
post5 = Post.create(author: user1, title: 'Hello', text: 'Hello World!')
post6 = Post.create(author: user1, title: 'Howdy', text: 'This is test post.')
post7 = Post.create(author: user1, title: 'Greetings', text: 'Good evening from Nigeria')

# # Comments

Comment.create(author: user1, post: post1, text: 'Sure. Great reminder, thanks!')
Comment.create(author: user1, post: post1, text: 'So relevant. Keep it up!')
Comment.create(author: user1, post: post1, text: 'Thank you so much!')
Comment.create(author: user1, post: post1, text: 'So smart... Lorem ipsum sit dolor amit.')
Comment.create(author: user1, post: post1, text: 'Sure. Great reminder, thanks!')
Comment.create(author: user2, post: post5, text: 'So relevant. Keep it up!')
Comment.create(author: user2, post: post5, text: 'Thank you so much!')
Comment.create(author: user2, post: post5, text: 'Excellent.')
Comment.create(author: user1, post: post1, text: 'Another great job.')
Comment.create(author: user1, post: post3, text: 'So smart... Lorem ipsum sit dolor amit.')
Comment.create(author: user2, post: post5, text: 'What a great work.')
Comment.create(author: user2, post: post5, text: 'Wel done! Go ahead.')
Comment.create(author: user2, post: post5, text: 'So smart... Lorem ipsum sit dolor amit.')
Comment.create(author: user1, post: post2, text: 'So smart... Lorem ipsum sit dolor amit.')
Comment.create(author: user1, post: post2, text: 'Oh! hello')
Comment.create(author: user2, post: post6, text: 'Nice job.')
Comment.create(author: user2, post: post7, text: 'Sure. Great reminder, thanks!')
