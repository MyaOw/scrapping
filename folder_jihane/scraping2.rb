require 'rubygems'
require 'nokogiri'
require 'open-uri'
 

def get_the_cours_cryptomonnaies(url)

    page = Nokogiri::HTML(open(url))   rescue false
    
    hash = {}
    
    if page
        monnaies =  page.css('#currencies-all tbody tr')
        
        #puts monnaies.inspect
        
        monnaies.each{ |x|
            
            hash2 = {}
            hash2['price'] = x.css('td a.price').text
            hash2['taux'] = x.css('td.percent-change').text
            
            hash[x.css('td a.currency-name-container').text] = hash2
            
            
            #percent-change
        }
    end
    
    return hash
end #get_the_cours_cryptomonnaies    

puts get_the_cours_cryptomonnaies("https://coinmarketcap.com/all/views/all/") 








