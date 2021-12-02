# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

Crypto.destroy_all

puts "Seeding..."
url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{ENV['COINMARKETCAP_API_KEY']}"
url_serialized = URI.open(url).read
cryptos_obj = JSON.parse(url_serialized)
cryptos = cryptos_obj['data']

cryptos.each do |crypto|
  Crypto.create!(
    name: crypto['name'],
    symbol: crypto['symbol'],
    max_supply: crypto['max_supply'],
    circulating_supply: crypto['circulating_supply'],
    total_supply: crypto['total_supply'],
    market_cap: crypto['quote']['USD']['market_cap'],
    market_cap_dominance: crypto['quote']['USD']['market_cap_dominance'],
    price: crypto['quote']['USD']['price'],
    volume_24h: crypto['quote']['USD']['volume_24h'],
    volume_change_24h: crypto['quote']['USD']['volume_change_24h'],
    percent_change_1h: crypto['quote']['USD']['percent_change_1h'],
    percent_change_24h: crypto['quote']['USD']['percent_change_24h'],
    percent_change_7d: crypto['quote']['USD']['percent_change_7d'],
    percent_change_30d: crypto['quote']['USD']['percent_change_30d'],
    vote: 0
  )
end

puts "End seeding...."
