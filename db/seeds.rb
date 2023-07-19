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
    {
      name: 'iPhone14 Pro',
      price: 149_800,
      description: "iPhone14 Pro 128GB DeepPurple 6.1インチディスプレイ\n究極のiPhone",
      image: 'app/assets/images/iPhone14Pro_purple.jpg',
      filename: 'iPhone14Pro_purple.jpg'
    },
    {
      name: 'iPhone14',
      price: 119_800,
      description: "iPhone14 128GB Yellow 6.1インチディスプレイ\nすべてがパワフル。",
      image: 'app/assets/images/iPhone14_yellow.jpg',
      filename: 'iPhone14_yellow.jpg'
    },
    {
      name: 'iPhone13',
      price: 107_800,
      description: "iPhone13 128GB Blue 6.1インチディスプレイ\n驚きを詰め込みました",
      image: 'app/assets/images/iPhone13_blue.jpg',
      filename: 'iPhone13_blue.jpg'
    },
    {
      name: 'iPhoneSE',
      price: 62_800,
      description: "iPhoneSE 64GB Product Red 4.7インチディスプレイ\nパワーをみんなの手に",
      image: 'app/assets/images/iPhoneSE_red.jpg',
      filename: 'iPhoneSE_red.jpg'
    },
    {
      name: 'iPad Pro',
      price: 124_800,
      description: "iPad Pro 128GB SpaceGray 11インチディスプレイ\n先端のテクノロジーで、究極のiPad体験を",
      image: 'app/assets/images/iPadPro_gray.jpg',
      filename: 'iPadPro_gray.jpg'
    },
    {
      name: 'iPad Air',
      price: 92_800,
      description: "iPad Air 64GB Blue 10.9インチディスプレイ\n薄くて軽いデザイン。驚異的なパフォーマンス",
      image: 'app/assets/images/iPadAir_blue.jpg',
      filename: 'iPadAir_blue.jpg'
    },
    {
      name: 'iPad 10th',
      price: 68_800,
      description: "iPad 10th 64GB Yellow 10.9インチディスプレイ\nすべてが新しい。すべてがカラフル。すべてが楽しい",
      image: 'app/assets/images/iPad10_yellow.jpg',
      filename: 'iPad10_yellow.jpg'
    },
    {
      name: 'iPad mini',
      price: 78_800,
      description: "iPad mini 64GB Purple 8.3インチディスプレイ\niPad体験のすべてを、ミニサイズに",
      image: 'app/assets/images/iPadmini_purple.jpg',
      filename: 'iPadmini_purple.jpg'
    }
  ]

Product.destroy_all

attributes.each do |attribute|
  product = Product.create!(
    name: attribute[:name],
    price: attribute[:price],
    description: attribute[:description]
  )

  product.image.attach(io: File.open(Rails.root.join(attribute[:image])), filename: (attribute[:filename]).to_s)
end
