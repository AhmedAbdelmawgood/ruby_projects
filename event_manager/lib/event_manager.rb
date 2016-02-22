require 'csv'
require 'sunlight/congress'
require 'erb'
#puts "succeed" if File.read('event_attendees.csv')
Sunlight::Congress.api_key = "2b4739faeaab4a9bb420d7978c70975b"

def clean_zipcode(zipcode)
   zipcode.to_s.rjust(5,"0")[0..4]
end

def search_zipcode(zip)
  legislators = Sunlight::Congress::Legislator.by_zipcode(zip)
end
def save_thank_letter( id, form_letter )
  Dir.mkdir("output") unless Dir.exist?"output"
  file_name = "output/thank_#{id}.html"
  File.open(file_name, "w") {|handler| handler.puts form_letter}
end

templete = File.read("form_letter.erb")
erb_templete = ERB.new templete
contents = CSV.open("full_event_attendees.csv", headers: true, header_converters: :symbol)
contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = search_zipcode(zipcode)
  form_letter =erb_templete.result(binding)
  save_thank_letter(id, form_letter)
  #p "#{name} : #{zipcode}: #{legislators}"
end
