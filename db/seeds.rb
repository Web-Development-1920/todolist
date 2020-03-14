# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tasks = Task.create([{name: 'Sprint 1', priority: 'High'}, {name: 'Sprint 2', priority: 'Medium'}, {name: 'Sprint 3', priority: 'Low'}])
Project.create(name: 'Web Development Lab', description: 'Web Development Laboratory 2020. ToDo List application')
