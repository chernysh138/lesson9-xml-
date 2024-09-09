require "rexml/document"
require "date"
file_path = (__dir__ + "/dr.xml")
unless File.exist?(file_path)
  xmlfile = File.open(file_path, "w") do |file|
    file.puts "<?xml version='1.0' encoding='UTF-8'?>"
    file.puts "<wishes></wishes>"
  end
end
xmlfile = File.read(file_path)
xmldoc = REXML::Document.new(xmlfile)
puts "В этом сундуке хранятся ваши желания.
Чего бы вы хотели?"

dream = STDIN.gets.chomp
puts "До какой даты вы бы хотели это осуществить"
data = STDIN.gets.chomp

wishes = xmldoc.root
wish = wishes.add_element("wish", { "date" => data })
wish.text = dream
xmlfile = File.open(file_path, "w") do |file|
  xmldoc.write(file, 2)
end

puts "информация успешно сохранена"
