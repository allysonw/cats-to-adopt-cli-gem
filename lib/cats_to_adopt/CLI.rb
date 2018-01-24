# CLI Controller
class CatsToAdopt::CLI

  def call
    list_cats
    menu
    goodbye
  end

  def list_cats
    puts "\nCats available now:"
    @cats = CatsToAdopt::Cat.scrape_cats

    @cats.each.with_index(1) do |cat, i|
      puts "#{i}. #{cat.name} - #{cat.gender} - #{cat.size}"
    end

  end

  def menu
    input = nil
    while input != "exit"
      puts "\nEnter the number of the cat you would like more info on."
      puts "Type list to list all cats or exit to exit the program."
      input = gets.strip

      if input.to_i > 0
        @cats[input.to_i - 1].print_cat_info
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
