# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(1..8).each do |n|
  product = Product.create!(
    name: "iPhone#{n}",
    price: n * 1000,
    description: 'hoge hoge',
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/iPhone14_yellow.jpg')), filename: 'iPhone14_yellow.jpg')
  )
end
