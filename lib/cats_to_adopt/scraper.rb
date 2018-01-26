class CatsToAdopt::Scraper

  # returns an array of hashes of cat attributes for the cats on the main page
  def scrape_main_page(main_page_url)
    main_page = Nokogiri::HTML(open(main_page_url))
    cat_attributes = []

    main_page.search(".pet-list-item").each_with_index do |cat, i|
      cat_attributes[i] = {
        name: cat.search(".views-field-field-animal-name").text.strip,
        id: cat.search(".views-field-field-animal-name a").attr("href").text.gsub("/get-involved/adopt/pet/", "").strip,
        gender: cat.search(".views-field-field-animal-sex .field-content").text.strip,
        size: cat.search(".views-field-field-animal-size .field-content").text.strip,
        location: cat.search(".views-field-field-shelter-state .field-content").text.strip
      }
    end

    cat_attributes
  end

  # given a cat's profile page URL, scrapes the cat's profile page and returns a
  # hash of additional attributes for that cat
  def scrape_profile_page(profile_url)
    profile_page = Nokogiri::HTML(open(profile_url))
    attributes = {}

    attributes[:color] = profile_page.search(".petpoint-pet-color .info").text.strip
    attributes[:weight] = profile_page.search(".card__info .petpoint-pet-weight:nth-child(7) .info").text.strip
    attributes[:age] = profile_page.search(".card__info .petpoint-pet-age:nth-child(4) .info").text.strip

    attributes
  end
end # end Scraper class
