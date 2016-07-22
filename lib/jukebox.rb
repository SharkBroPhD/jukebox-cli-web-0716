require 'pry'

songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help 
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays the list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "-exit : exits this program"
end

def list(array)
  array.each do |song|
    index=array.index("#{song}")
    puts "#{index+1}. #{song}"
  end
end

def play(array)
  puts "Please enter a song name or number:"
  user_response=gets.chomp
  song_found=false
  array.each do |song|
    if array.index("#{song}")+1 == user_response.to_i || song == user_response
      puts "Playing #{song}"
      song_found=true
    end
  end
  if song_found == false
  puts "Invalid input, please try again"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(array)
  help
  puts "Please enter a command:"
  run_input=gets.chomp
    until run_input == "exit"
      if run_input == "list"
        list(array)
      elsif run_input == "play"
        play(array)
      elsif run_input == "help"
        help
      end 
      puts "Please enter a command:"
      run_input=gets.chomp
    end
    exit_jukebox
end
