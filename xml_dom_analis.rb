require "rexml/document"
include REXML
xmlfile = File.new("movies.xml")
xmldoc = Document.new(xmlfile)
root = xmldoc.root
puts "Атрибут корневого элемента:" + root.attributes["shelf"]
xmldoc.elements.each("collection/movie") do |e|
  puts "Атрибут в теге movie: " + e.attributes["title"]
end
xmldoc.elements.each("collection/movie/type") do |e|
  puts "Элемент тега type: " + e.text
end
xmldoc.elements.each("collection/movie/description") do |e|
  puts "Элемент тега description: " + e.text
end
