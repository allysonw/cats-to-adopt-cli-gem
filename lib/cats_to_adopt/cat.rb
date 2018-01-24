class CatsToAdopt::Cat
  attr_accessor :name, :gender, :size, :location, :image_url

  def self.available_cats
    #returns a bunch of instances of cats
    cats = []
    cats = self.scrape_cats_from_NKLA
    #cats = self.scrape_cats_from_othersite

  end

  def self.scrape_cats_from_NKLA
    doc = Nokogiri::HTML(open("https://la.bestfriends.org/get-involved/adopt/pets?field_animal_species_tid_selective=958"))

    cats = []
    cat_list = doc.search(".pet-list-item")

    cat_list.each do |cat|
      new_cat = self.new
      new_cat.name = cat.search(".views-field-field-animal-name").text.strip
      new_cat.gender = cat.search(".views-field-field-animal-sex .field-content").text.strip
      new_cat.size = cat.search(".views-field-field-animal-size .field-content").text.strip
      new_cat.location = cat.search(".views-field-field-shelter-state .field-content").text.strip
      new_cat.image_url = "https://la.bestfriends.org#{cat.search(".views-field-field-animal-image img").attr("src")}"

      cats << new_cat
    end

    cats
  end

  def self.scrape_cat_page

  end

  def print_cat_info
    puts "Cat Name: #{self.name}"
    puts "Cat Gender: #{self.gender}"
    puts "Cat Size: #{self.size}"
    puts "Cat Location: #{self.location}"
    puts "Cat Image Link: #{self.image_url}\n"
  end

end
