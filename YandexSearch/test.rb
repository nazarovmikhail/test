require 'rubygems'
require 'mechanize'

a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

page = a.get('http://www.yandex.ru/')

form = page.forms.first

form['text'] = 'Dolores oriordan'

page = form.submit

page.search('/html/body/div[2]/div[2]/div[2]/div[1]/div[2]/div[1]/div/div[1]/div[2]/div[2]/dl/div[2]/dd/a').each do |text|
    puts text.text
end
