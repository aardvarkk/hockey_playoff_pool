require 'nokogiri'
require 'open-uri'

base = 'http://www.nhl.com'

mode = ARGV[0].to_sym

path = {}
path[:fwd] = '/ice/playerstats.htm?fetchKey=20142ALLFAFALL&sort=player.bioFirstNameLastName&viewName=summary'
path[:def] = '/ice/playerstats.htm?fetchKey=20142ALLDADALL&sort=player.bioFirstNameLastName&viewName=summary'
path[:gls] = '/ice/playerstats.htm?fetchKey=20142ALLGAGALL&sort=player.bioFirstNameLastName&viewName=summary'

doc = Nokogiri::HTML(open(base + path[mode]))

f = File.open(mode.to_s, 'w')

while true
  puts "Scraping page..."

  players = doc.css 'table.data.stats tbody tr'
  player = {}
  players.each do |p|

    if mode == :gls
      info = [
        p.children[1].text,
        p.children[2].text.upcase,
        p.children[3].text.to_i,
        2*p.children[5].text.to_i + p.children[13].text.to_i
      ]
    else
      info = [
        p.children[1].text,
        p.children[2].text.upcase,
        p.children[4].text.to_i,
        p.children[7].text.to_i
      ]
    end
    f.puts(info.join("\n"))
  end
  
  next_link = doc.at "a[text()*='Next']"
  break if !next_link

  doc = Nokogiri::HTML(open(base + next_link[:href]))
end
f.close
