require "rexml/document"
require "date"
puts "На что потратили деньги"
expense_text = STDIN.gets.chomp
puts "Сколько потратили"
expense_amount = STDIN.gets.to_i
puts "Укажите дату в фотмате дд.мм.гг(пустое поле сегодня)"
date_input = STDIN.gets.chomp
expense_date = nil
if date_input == ""
  expense_date = Date.today
else
  begin
    expense_date = Date.parse(date_input)
  rescue ArgumentError
    expense_date = Date.today
  end
end
puts "В какую категорию занести трату"
expense_category = STDIN.gets.chomp
# Сначала получим текущее содержимое файла
# И построим из него XML-структуру в переменной doc
file_name = (__dir__ + "/expenses.xml")
file = File.new(file_name, "r")
doc = nil
begin
  doc = REXML::Document.new(file)
rescue REXML::ParseException => e
  puts "XML похоже битый"
  abort e.massage
end
file.close
# Добавим трату в нашу XML-структуру в переменной doc
# Для этого найдём элемент expenses (корневой)
expenses = doc.elements.find("expenses").first
expense = expenses.add_element "expense", {
  "amount" => expense_amount,
  "category" => expense_category,
  "date" => expense_date.strftime("%Y.%m.%d"),
}
expense.text = expense_text
# Осталось только записать новую XML-структуру в файл методов write
# В качестве параметра методу передаётся указатель на файл
# Красиво отформатируем текст в файлике с отступами в два пробела
file = File.new(file_name, "w")
doc.write(file, 2)
file.close
puts "Информация успешно сохранена"
