# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  Category.create!(
    name: "categoria-#{i+1}",
    status: rand(0..1)
  )
end

5.times do |i|
  Category.create!(
    name: "sub-categoria-#{i+1}",
    status: rand(0..1),
    category_id: i+1
  )
end

5.times do |i|
  Type.create!(
    name: "tipo-#{i+1}"
  )
end

type = Type.all
category = Category.all.where(category_id: nil)

20.times do |i|
  Mark.create!(
    url: "url-#{i+1}",
    category: category.sample,
    type: type.sample
  )
end