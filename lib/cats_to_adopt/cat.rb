class CatsToAdopt::Cat
  attr_accessor :name, :gender, :size, :location, :profile_url, :id, :age, :color, :weight

  BASE_PATH = "https://la.bestfriends.org/get-involved/adopt/pet/"

  def self.scrape_cats

    cats = []

    # scrape main page
    main_page = Nokogiri::HTML(open("https://la.bestfriends.org/get-involved/adopt/pets?field_animal_species_tid_selective=958"))

    cat_list = main_page.search(".pet-list-item")

    cat_list[0..9].each do |cat|
      new_cat = self.new
      new_cat.name = cat.search(".views-field-field-animal-name").text.strip
      new_cat.id = cat.search(".views-field-field-animal-name a").attr("href").text.gsub("/get-involved/adopt/pet/", "").strip
      new_cat.gender = cat.search(".views-field-field-animal-sex .field-content").text.strip
      new_cat.size = cat.search(".views-field-field-animal-size .field-content").text.strip
      new_cat.location = cat.search(".views-field-field-shelter-state .field-content").text.strip
      new_cat.profile_url = BASE_PATH + new_cat.id

      cats << new_cat # cats is an array of cat objects with several attributes assigned, but not all
    end

    # scrape each cat's profile page and add additional attributes
    cats.each do |cat|
      profile_page = Nokogiri::HTML(open(BASE_PATH + cat.id))

      cat.color = profile_page.search(".petpoint-pet-color .info").text.strip
      cat.weight = profile_page.search(".card__info .petpoint-pet-weight:nth-child(7) .info").text.strip
      cat.age = profile_page.search(".card__info .petpoint-pet-age:nth-child(4) .info").text.strip
    end

    cats
  end

  def print_cat_info
    puts "\nCat Name: #{self.name}"
    puts "-- ID: #{self.id}"
    puts "-- Gender: #{self.gender}"
    puts "-- Age: #{self.age}"
    puts "-- Color: #{self.color}"
    puts "-- Size: #{self.size}"
    puts "-- Weight: #{self.weight}"
    puts "-- Location: #{self.location}"
    puts "-- Profile Link: #{self.profile_url}\n"
  end

end
