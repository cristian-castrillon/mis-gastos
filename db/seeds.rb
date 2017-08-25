# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = ['Restaurants', 'Grocery', 'Car', 'Services', 'Home', 'Education', 'Fun', 'Travel']
categories.each do |category|
  Category.create(name: category)
end

10.times do
  Expense.create(expense_type: 'compra', date: Faker::Date.between(6.months.ago, Date.today), concept: Faker::Food.spice, category_id: 1, amount: Faker::Number.decimal(5, 2))
end

10.times do
  Expense.create(expense_type: 'retiro', date: Faker::Date.between(6.months.ago, Date.today), concept: Faker::Food.ingredient, category_id: 2, amount: Faker::Number.decimal(5, 2))
end

10.times do
  Expense.create(expense_type: 'transferencia', date: Faker::Date.between(6.months.ago, Date.today), concept: Faker::Vehicle.manufacture, category_id: 3, amount: Faker::Number.decimal(5, 2))
end

10.times do
  Expense.create(expense_type: 'pago', date: Faker::Date.between(6.months.ago, Date.today), concept: Faker::Company.bs, category_id: 4, amount: Faker::Number.decimal(5, 2))
end

10.times do
  Expense.create(expense_type: 'compra', date: Faker::Date.between(6.months.ago, Date.today), concept: Faker::Commerce.product_name, category_id: 5, amount: Faker::Number.decimal(5, 2))
end

10.times do
  Expense.create(expense_type: 'retiro', date: Faker::Date.between(6.months.ago, Date.today), concept: Faker::Educator.course, category_id: 6, amount: Faker::Number.decimal(5, 2))
end

10.times do
  Expense.create(expense_type: 'transferencia', date: Faker::Date.between(6.months.ago, Date.today), concept: Faker::Pokemon.name, category_id: 7, amount: Faker::Number.decimal(5, 2))
end

10.times do
  Expense.create(expense_type: 'pago', date: Faker::Date.between(6.months.ago, Date.today), concept: Faker::LordOfTheRings.location, category_id: 8, amount: Faker::Number.decimal(5, 2))
end