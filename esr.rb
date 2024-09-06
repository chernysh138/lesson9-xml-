require "builder"
xml = Builder::XmlMarkup.new(indent: 2)
xml.instruct! :xml, version: "1.0", encoding: "UTF-8"
xml.person do
  xml.name "jon doooo"
  xml.age 40
  xml.email "jo@doo"
end
puts xml.target!
