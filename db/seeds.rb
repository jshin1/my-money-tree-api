# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Asset.destroy_all
Liability.destroy_all

User.create(name: 'John Doe', username: 'test', password: '123', job_title: 'Engineer', company: 'N/A')

Asset.create(name: 'Cash', amount: 4000, user_id: 1)
Asset.create(name: '401K', amount: 3000, user_id: 1)
Asset.create(name: 'Stock Portfolio', amount: 10000, user_id: 1)

Liability.create(name: 'Credit Card Balance', amount: 10000, user_id: 1)
Liability.create(name: 'Personal Loans', amount: 1000, user_id: 1)
Liability.create(name: 'Student Loans', amount: 50000, user_id: 1)
