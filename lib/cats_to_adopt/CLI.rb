class CatsToAdopt::CLI

  BASE_PATH = "https://la.bestfriends.org/get-involved/adopt/"

  def call
    intro_message
    make_cats
    list_cats
    menu
    goodbye
  end

  def intro_message
    puts "\n-----------------------------"
    puts "| Welcome to Cats to Adopt! |"
    puts "-----------------------------\n\n"
    puts "Retrieving cat info..."
  end

  def make_cats
    cat_attributes = CatsToAdopt::Scraper.new.scrape_main_page(BASE_PATH + 'pets?field_animal_species_tid_selective=958')

    CatsToAdopt::Cat.create_from_collection(cat_attributes)
  end

  def list_cats
    CatsToAdopt::Cat.print_cats
  end

  def menu
    input =  ""

    while input != "exit"
      puts "\nEnter the number of the cat you would like more info on."
      puts "Type list to list all cats or exit to exit the program."
      input = gets.strip

      cats = CatsToAdopt::Cat.all

      if input.to_i > 0 && input.to_i < cats.size + 1
        selected_cat = cats[input.to_i - 1]

        if selected_cat.color == nil # we have not yet scraped this cat's profile page
          attributes = CatsToAdopt::Scraper.new.scrape_profile_page(BASE_PATH + 'pet/' + selected_cat.id)
          selected_cat.add_cat_attributes(attributes)
        end

        selected_cat.print_cat_info
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

end # end CLI class
