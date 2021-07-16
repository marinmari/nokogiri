require 'rubygems'
require 'nokogiri'
require 'pry'
require 'rspec'
require 'rubocop'
require 'dotenv'
require 'open-uri'


#1ère fonction qui permet de récupérer un e-mail 
def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(open(townhall_url))
    townhall_email = []

    page.xpath('//section[2]/div/table/tbody/tr[4]/td[2]').each do |mail|
    townhall_email.push(mail.text)
    end
    return townhall_email
end

def get_townhall_urls
    page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
    townhall_url = []

    page.xpath('//tr/td/p/a/@href').each do |url|
        townhall_url.push(url.text.to_s.sub(/[.]/ , "http://annuaire-des-mairies.com"))
    end

    return townhall_url
end



puts get_townhall_urls
puts get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")
puts