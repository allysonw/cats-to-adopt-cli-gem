class CatsToAdopt::Scraper

  # for each cat on the main page, scrapes the page for the cat's data and
  # instantiates a Cat object with that data. Returns an array of Cat objects with several # the basic attributes assigned.
  def self.scrape_main_page(main_page_url)

    main_page = Nokogiri::HTML(open(main_page_url))

    main_page.search(".pet-list-item").each do |cat|
      new_cat = CatsToAdopt::Cat.new
      new_cat.name = cat.search(".views-field-field-animal-name").text.strip
      new_cat.id = cat.search(".views-field-field-animal-name a").attr("href").text.gsub("/get-involved/adopt/pet/", "").strip
      new_cat.gender = cat.search(".views-field-field-animal-sex .field-content").text.strip
      new_cat.size = cat.search(".views-field-field-animal-size .field-content").text.strip
      new_cat.location = cat.search(".views-field-field-shelter-state .field-content").text.strip
    end
  end

  # given a cat's profile page URL, scrapes the cat's profile page and returns a hash of additional attributes for that cat
  def self.scrape_profile_page(profile_url)
    profile_page = Nokogiri::HTML(open(profile_url))
    attributes = {}

    attributes[:color] = profile_page.search(".petpoint-pet-color .info").text.strip
    attributes[:weight] = profile_page.search(".card__info .petpoint-pet-weight:nth-child(7) .info").text.strip
    attributes[:age] = profile_page.search(".card__info .petpoint-pet-age:nth-child(4) .info").text.strip

    attributes
  end
end # end Scraper class
