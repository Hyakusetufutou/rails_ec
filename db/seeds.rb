# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
attributes = 
[
  {name: 'iPhone14 Pro' , price: 149800, description: "iPhone14 Pro 128GB DeepPurple 6.1インチディスプレイ\n究極のiPhone",                        image: 'app/assets/images/iPhone14Pro_purple.jpeg', filename: 'iPhone14Pro_purple.jpeg'},
  {name: 'iPhone14'     , price: 119800, description: "iPhone14 128GB Yellow 6.1インチディスプレイ\nすべてがパワフル。",                            image: 'app/assets/images/iPhone14_yellow.jpeg' , filename: 'iPhone14_yellow.jpeg'},
  {name: 'iPhone13'     , price: 107800, description: "iPhone13 128GB Blue 6.1インチディスプレイ\n驚きを詰め込みました",                            image: 'app/assets/images/iPhone13_blue.jpeg', filename: 'iPhone13_blue.jpeg'},
  {name: 'iPhoneSE'     , price: 62800,  description: "iPhoneSE 64GB Product Red 4.7インチディスプレイ\nパワーをみんなの手に",                      image: 'app/assets/images/iPhoneSE_red.jpeg', filename: 'iPhoneSE_red.jpeg'},
  {name: 'iPad Pro'     , price: 124800, description: "iPad Pro 128GB SpaceGray 11インチディスプレイ\n先端のテクノロジーで、究極のiPad体験を",         image: 'app/assets/images/iPadPro_gray.jpeg'   , filename: 'iPadPro_gray.jpeg'},
  {name: 'iPad Air'     , price: 92800,  description: "iPad Air 64GB Blue 10.9インチディスプレイ\n薄くて軽いデザイン。驚異的なパフォーマンス",          image: 'app/assets/images/iPadAir_blue.jpeg', filename: 'iPadAir_blue.jpeg'},
  {name: 'iPad 10th'    , price: 68800,  description: "iPad 10th 64GB Yellow 10.9インチディスプレイ\nすべてが新しい。すべてがカラフル。すべてが楽しい",  image: 'app/assets/images/iPad10_yellow.jpeg', filename: 'iPad10_yellow.jpeg'},
  {name: 'iPad mini'    , price: 78800,  description: "iPad mini 64GB Purple 8.3インチディスプレイ\niPad体験のすべてを、ミニサイズに",                image: 'app/assets/images/iPadmini_purple.jpeg', filename: 'iPadmini_purple.jpeg'},
]

Product.destroy_all

attributes.each do |attribute|
  product = Product.create!(
    name: attribute[:name],
    price: attribute[:price],
    description: attribute[:description],
  )

  product.image.attach(io: File.open(Rails.root.join(attribute[:image])),filename: "#{attribute[:filename]}")
end

