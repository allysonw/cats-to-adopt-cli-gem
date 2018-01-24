# CLI Controller
class CatsToAdopt::CLI

  BASE_PATH = "https://la.bestfriends.org/get-involved/adopt/"

  def call
    make_cats
    list_cats
    menu
    goodbye
  end

  def make_cats
    CatsToAdopt::Scraper.scrape_main_page(BASE_PATH + 'pets?field_animal_species_tid_selective=958')
  end

  def list_cats
    CatsToAdopt::Cat.print_cats
  end

  def menu
    input = nil

    while input != "exit"
      puts "\nEnter the number of the cat you would like more info on."
      puts "Type list to list all cats or exit to exit the program."
      input = gets.strip

      cats = CatsToAdopt::Cat.all

      if input.to_i > 0 && input.to_i < cats.size + 1
        cat_in_question = cats[input.to_i - 1]
        attributes = CatsToAdopt::Scraper.scrape_profile_page(BASE_PATH + 'pet/' + cat_in_question.id)
        cat_in_question.add_cat_attributes(attributes)
        cat_in_question.print_cat_info
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
