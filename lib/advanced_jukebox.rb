require 'pry'

#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

my_songs = {
"Go Go GO" => '/Users/Troy/Development/code/jukebox-cli-web-0716/audio/Emerald-Park/01.mp3',
"LiberTeens" => '/Users/Troy/Development/code/jukebox-cli-web-0716/audio/Emerald-Park/02.mp3',
"Hamburg" =>  '/Users/Troy/Development/code/jukebox-cli-web-0716/audio/Emerald-Park/03.mp3',
"Guiding Light" => '/Users/Troy/Development/code/jukebox-cli-web-0716/audio/Emerald-Park/04.mp3',
"Wolf" => '/Users/Troy/Development/code/jukebox-cli-web-0716audio/Emerald-Park/05.mp3',
"Blue" => '/Users/Troy/Development/code/jukebox-cli-web-0716/audio/Emerald-Park/06.mp3',
"Graduation Failed" => '/Users/Troy/Development/code/jukebox-cli-web-0716/audio/Emerald-Park/07.mp3'
}

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays the list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "-exit : exits this program"
end



def list(my_songs)
  my_songs.each do |title,audio|
    puts title
  end
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  
  puts "Please enter a song name:"
  user_response=gets.chomp
  song_found=false
  my_songs.each do |title, audio|
    if title == user_response
      song_found=true
      song=my_songs[title]
      system "open #{song}"
    end
  end
  if song_found == false
    puts "Invalid input, please try again."
  end
end

def exit_jukebox
  #this method is the same as in jukebox.rb
    puts "Goodbye"
end

def run(my_songs)
  help
  puts "Please enter a command:"
  run_input=gets.chomp
  until run_input == "exit"
    if run_input == "list"
      list(my_songs)
    elsif run_input == "play"
      play(my_songs)
    elsif run_input == "help"
      help
    end 
    puts "Please enter a command:"
    run_input=gets.chomp
  end
  exit_jukebox
end
