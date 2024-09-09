require "rexml/document"
require "date"
include REXML
puts "Ваши желания, которые сбылись"
xmlfile = File.read("unf_dream.xml")
xmldoc = Document.new(xmlfile)
xmldoc.elements.each("wishes/wish") do |e|
  data = e.attributes["data"]
  text = e.text
  puts "на #{data} исполнилось #{text}"
end
puts "желания которым предстоит сбыться"

puts "напишите ваше желание"
unfdream = STDIN.gets.chomp.to_s
puts "напишите дату"
date_input = STDIN.gets.chomp.to_s

wishes = xmldoc.root
wish = wishes.add_element("wish", { "data" => date_input })
unfdream = wish.text
xmlfile = File.open("unf_dream.xml", "w") do |f|
  xmldoc.write(f, 2)
end
