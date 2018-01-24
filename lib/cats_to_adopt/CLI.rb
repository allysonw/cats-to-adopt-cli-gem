# CLI Controller
class CatsToAdopt::CLI

  def call
    puts "Cats available now:"
    list_cats
    menu
  end

  def list_cats
    puts <<~HEREDOC
    1. Finn - Domestic Short Hair - Male - Young - 1 mile away
    2. Cliff - Domestic Short Hair - Male - Kitten - 1 mile away
    HEREDOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the cat you would like more info on."
      puts "Type list to list all cats or exit to exit the program."
      input = gets.strip

      if input.to_i > 0
        puts "Here is the cat info you requested!"
      elsif input == "list"
        list_cats
      else
        puts "Please enter the number of a cat, list, or exit."
      end
    end

  end

end
