require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_currencies
  page = Nokogiri::HTML(open("https://coinmarketcap.com/fr/all/views/all/"))
hash = {}
if page
  monnaies = page.css('#currencies-all tbody tr')

  monnaies.each{ |x|
      hash2 = {}
      hash2['price'] = x.css('td a.price').text
      hash2['taux'] = x.css("[@data-timespan='1h']").text
      hash[x.css('td a.currency-name-container').text] = hash2
  }
end
  return hash
end
get_currencies.each do |name, price, value|
  puts "#{name} #{price} #{value}"
end