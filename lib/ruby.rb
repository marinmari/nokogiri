require 'rubygems'
require 'nokogiri'
require 'pry'
require 'rspec'
require 'rubocop'
require 'dotenv'
require 'open-uri'

#On lit la page
def page_reading
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    crypto_name_array = []
    crypto_value_array = []

    # on récupère 
    page.xpath('//tr/td[3]/div').each do |crypto|
        crypto_name_array.push(crypto.text)
    end

    page.xpath('//tr/td[5]/div').each do |value|
       crypto_value_array.push(value.text)
    end

    general_array = crypto_name_array.zip(crypto_value_array).map { |x, y| {x=>y.delete('$,').to_f}}

    return general_array

end

print page_reading
puts 