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
    puts "Enter the number of the cat you would like more info on."
  end

end
