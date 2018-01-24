# CLI Controller
class CatsToAdopt::CLI

  def call
    list_cats
    menu
    goodbye
  end

  def list_cats
    puts "\nCats available now:"

    puts <<~HEREDOC
    1. Finn - Domestic Short Hair - Male - Young - 1 mile away
    2. Cliff - Domestic Short Hair - Male - Kitten - 1 mile away
    HEREDOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nEnter the number of the cat you would like more info on."
      puts "Type list to list all cats or exit to exit the program."
      input = gets.strip

      if input.to_i > 0
        puts "\nHere is the cat info you requested!"
      elsif input == "list"
        list_cats
      elsif input == "exit"
        puts "\nClosing program ..."
      else
        puts "Please enter the number of a cat, list, or exit."
      end
    end

    def goodbye
      puts "\nGoodbye!"
    end

  end

end
