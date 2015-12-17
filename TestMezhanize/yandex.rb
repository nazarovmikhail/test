require 'rubygems'
require 'mechanize'

a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

a.get('http://yandex.ru') do |page|
	w_block = page.search('.b-inline inline-stocks__item inline-stocks__item_id_2002 hint__item')
	l = w_block.search('class').last
	puts l
end