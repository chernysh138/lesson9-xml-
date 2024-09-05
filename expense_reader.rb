require "rexml/document"

xmlfile = File.read(__dir__ + "/my_expenses.xml")
xmldoc = REXML::Document.new(xmlfile)
expenses = xmldoc.root

expenses.elements.each do |i|
  name = i.text
  amount = i.attributes["amount"]
  date = i.attributes["date"]
  category = i.attributes["category"]

  puts "#{date} была куплена #{name} в категории #{category} в кол-ве #{amount} "
end
