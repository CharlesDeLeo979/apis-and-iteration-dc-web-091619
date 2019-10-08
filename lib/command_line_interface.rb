def welcome
  puts "Welcome to STARWARS SEARCH!"
end

def get_character_from_user
  puts "please enter a character name"
  char = gets.chomp
  char.downcase
end
