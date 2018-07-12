require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_the_email_of_a_townhall_from_its_webpage(town)
  doc = Nokogiri::HTML(open(town))
  puts doc.css('#deputes-contact section dl dd a').attribute("href").text.sub("mailto:", "")
end

def get_all_the_urls_of_val_doise_townhalls
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
hash = {}
  page.css('.col3 li a').each do |url| 
    hash[url.text] = url['href'].sub("/deputes", "http://www2.assemblee-nationale.fr/deputes")
  end
  return hash
end
get_all_the_urls_of_val_doise_townhalls.each do |name,link|
  puts "#{name} #{get_the_email_of_a_townhall_from_its_webpage(link)}"
end