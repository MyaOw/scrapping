require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_the_email_of_a_townhall_from_its_webpage(town)
  doc = Nokogiri::HTML(open(town))
  puts doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

def get_all_the_urls_of_val_doise_townhalls
  page = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html"))
hash = {}
  page.css('.Style20 .lientxt').each do |url| 
    hash[url.text] = url['href'].sub("./", "http://www.annuaire-des-mairies.com/")
  end
  return hash
end
get_all_the_urls_of_val_doise_townhalls.each do |name,link|
  puts "#{name} #{get_the_email_of_a_townhall_from_its_webpage(link)}"
end