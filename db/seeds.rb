# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@mainph.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

require 'open-uri'

store_url = 'https://elevatedfaith.com'
# hoodie_url = store_url + '/collections/christian-hoodies'
# hoodie_url = store_url + '/collections/christian-t-shirts'
# hoodie_url = store_url + '/collections/tank-tops'
# hoodie_url = store_url + '/collections/kids'
hoodie_url = store_url + '/collections/christian-bracelets'

hoodies_html = open(hoodie_url).read
hoodies_doc = Nokogiri::HTML(hoodies_html)

hoodies_selector = 'div.grid-product__content'
hoodies_table = hoodies_doc.css(hoodies_selector)

# hoodies = Category.find(4)
# puts hoodie.name

hoodies_table.each do |hoodie|
  hoodie_name = hoodie.at_css('div.grid-product__title--body').content
  hoodie_price = hoodie.at_css('span.money').text
  hoodies.products.build(name: hoodie_name, price: hoodie_price[1..6], stock_quantity: 99).save
  # puts hoodie_name
  # puts hoodie_price[1..6]
end
