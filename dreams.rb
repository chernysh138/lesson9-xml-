require "rexml/document"
puts "В этом сундуке хранятся ваши желания.
Чего бы вы хотели?"
dream = STDIN.gets.chomp
puts "До какой даты вы бы хотели это осуществить"
data = STDIN.gets.chomp
file_path = (__dir__ + "/dr.xml")
xmlfile = File.new(file_path, "r")

xmldoc = REXML::Document.new(xmlfile)
xmlfile.close
wishes = xmldoc.root
wish = wishes.add_element("wish", { "date" => data })
wish.text = dream
xmlfile = File.new(file_path, "w")
xmldoc.write(xmlfile, 2)
xmlfile.close

puts "информация успешно сохранена"
