# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

# User.create!([
#   # {id: 1, name: "Die Hard - Blu-Ray", price: 9.95, active: true},
#   # {id: 2, name: "Iron Man 3 - Blu-Ray", price: 24.95, active: true},
#   # {id: 3, name: "Star Trek - Into Darkness - Blu-Ray", price: 19.95, active: true},
#   # {id: 4, name: "The Little Mermaid - Blu-Ray", price: 29.95, active: true},
#   {id: 1, email: "admin@email.com", password: "test1234"}
# ])

admin = User.create!({id: 1, email: "admin@email.com", password: "test1234"})
admin.add_role(:admin)
admin.save!
