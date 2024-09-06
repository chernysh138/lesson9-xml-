require "rexml/document"
include REXML
xmlfile = File.new("movies.xml")
xmldoc = Document.new(xmlfile)
#информация про первый найденый тег movie
movie = XPath.first(xmldoc, "//movie")
puts movie
# информация про содержание тега type
XPath.each(xmldoc, "//type") { |e| puts e.text }
# получить массив из тега format
names = XPath.match(xmldoc, "//format").map { |x| x.text }
print names
