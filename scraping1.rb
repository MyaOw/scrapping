require 'rubygems'
require 'nokogiri'
require 'open-uri'


############################################################


def get_the_email_of_a_townhal_from_its_webpage(town)
	page = Nokogiri::HTML(open(town))
	return page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

############################################################

def get_all_the_urls_of_val_doise_townhalls
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	linkall = page.css("a.lientxt")
    hash = {}
    
    linksel = linkall.each do |link| 
          hash[link.text] = link['href'].sub("./95/","http://annuaire-des-mairies.com/95/")
    end
    
    return hash
end

############################################################

get_all_the_urls_of_val_doise_townhalls.each do |name,link|
  puts "#{name} -- #{get_the_email_of_a_townhal_from_its_webpage(link)}"
end