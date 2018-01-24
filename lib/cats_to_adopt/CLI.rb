# CLI Controller
class CatsToAdopt::CLI

  BASE_PATH = "https://la.bestfriends.org/get-involved/adopt/pet/"

  def call
    make_cats
    #add_attributes_to_cats
    CatsToAdopt::Cat.print_cats
    menu
    goodbye
  end

  def make_cats
     Scraper.scrape_main_page('https://la.bestfriends.org/get-involved/adopt/pets?field_animal_species_tid_selective=958')
  end

  # def add_attributes_to_cats
  #   id = nil
  #   CatsToAdopt::Cat.all.each do |cat|
  #     attributes = Scraper.scrape_profile_page(BASE_PATH + cat.id)
  #     cat.add_cat_attributes(attributes)
  #   end
  # end

  def menu
    input = nil
    while input != "exit"
      puts "\nEnter the number of the cat you would like more info on."
      puts "Type list to list all cats or exit to exit the program."
      input = gets.strip

      cats = CatsToAdopt::Cat.all

      if input.to_i > 0 && input.to_i < cats.size + 1
        cat_in_question = cats[input.to_i - 1]
        attributes = Scraper.scrape_profile_page(BASE_PATH + cat_in_question.id)
        cat_in_question.add_cat_attributes(attributes)
        cat_in_question.print_cat_info
      elsif input == "list"
        CatsToAdopt::Cat.print_cats
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
