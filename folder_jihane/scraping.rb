require 'rubygems'
require 'nokogiri'
require 'open-uri'
 
def get_all_the_urls_of_val_doise_townhalls(url)

    page = Nokogiri::HTML(open(url))   
    links = page.css('a')
    urls = []

    links.each{
        |link| 
        urls.push link['href'].sub(".","http://annuaire-des-mairies.com")
    }
    
    return urls
    
end


def get_the_email_of_a_townhal_from_its_webpage(url)

    page = Nokogiri::HTML(open(url))   rescue false
    
    if page
return page.css('div main section[class="well section-border"] div table[class="table table-striped table-mobile mobile-primary round-small"] tbody tr')[3].css("td")[1].text
        
    end
    
    return ""
end #get_the_email_of_a_townhal_from_its_webpage    



urls = get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html") 

urls.each{
  |url| 
    puts get_the_email_of_a_townhal_from_its_webpage(url)
}









