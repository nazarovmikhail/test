require 'rubygems'
require 'mechanize'

a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

a.get('http://yandex.ru/') do |page|
  search_result = page.search(:name => '.input__control input__input') do |answer|
  answer.text = 'dolores oriordan'
  end.submit

  search_result.links.each do |link|
    puts link.text
  end
end