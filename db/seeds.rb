# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# #

#    = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ name: 'Harry Potter', email: 'thechosenone@gmail.com', password: 'Ginny'}])
Book.create([{ title: 'Furious Scroll', genre: 'Dark', difficulty: 4, user_id: 1}])
Spell.create([{ name: 'Mystic Rupture', description: 'Stuns opponents magical ability for 5 minutes', difficulty_level: 4, power_level: 6, book_id: 1}])
