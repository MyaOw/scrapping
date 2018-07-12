require 'rubygems'
require 'nokogiri'
require 'open-uri'
 
def get_all_the_urls_of_depute(url)
    
    page = Nokogiri::HTML(open(url))   
    links = page.css('#deputes-list a')
    urls = {}
    
    links.each{
        |link| 
        
        isValidLink = link['href'].sub("/deputes","http://www2.assemblee-nationale.fr/deputes") rescue false
        if (isValidLink)
            urls[link.text] = isValidLink
        end    
    }
    
    return urls    
end


def get_the_email_of_a_depute(name,url)

    page = Nokogiri::HTML(open(url)) rescue false
            
   if page
       return page.css('#deputes-contact section dl dd')[0].css("a").attribute("href").text.sub("mailto:","")
   end
    
    return ""
end #get_the_email_of_a_depute    



urls = get_all_the_urls_of_depute("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique") 

results = {}

urls.each{
  |name, url| 
  results[name] = get_the_email_of_a_depute(name,url)
   puts "#{name} - #{results[name]}" 
}

results.each{
  |name, mail| 
    puts "#{name} - #{mail}"
}







