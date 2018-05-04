

require 'unirest'

system "clear"
puts

puts "You're in the Dictionary App now."
puts "=================================="
puts


while true 

  print "Hello, enter a word and I'll return the definition of that word, an example sentence using the word, and how to pronounce the word."
  puts
  puts


  word = gets.chomp

  puts


  puts "Definition"
  puts "================"
  puts


  response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")



  puts response.body[0]["text"]

  top_example = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/examples?includeDuplicates=false&useCanonical=false&skip=0&limit=5&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

  puts 

  puts "Top Example"
  puts "================"
  puts
  puts top_example.body["examples"][0]["text"]

  puts 

  puts "Pronunciation"
  puts "================"
  puts
  pronunciation = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")



  puts pronunciation.body[0]["raw"]

  puts 

  puts 




  puts 
  puts "Enter q to quit, any other key to continue"
  input_option = gets.chomp
  if input_option == "q"
    system "clear"
    puts "Thank you for using the Dictionary App."
    break
  end
end 