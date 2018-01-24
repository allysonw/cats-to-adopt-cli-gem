# CLI Controller
class CatsToAdopt::CLI

  BASE_PATH = "https://la.bestfriends.org/get-involved/adopt/pet/"

  def call
    make_cats
    add_attributes_to_cats
    CatsToAdopt::Cat.print_cats
    menu
    goodbye
  end

  def make_cats
     Scraper.scrape_main_page('https://la.bestfriends.org/get-involved/adopt/pets?field_animal_species_tid_selective=958')
  end

  def add_attributes_to_cats
    id = nil
    CatsToAdopt::Cat.all.each do |cat|
      attributes = Scraper.scrape_profile_page(BASE_PATH + cat.id)
      cat.add_cat_attributes(attributes)
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
