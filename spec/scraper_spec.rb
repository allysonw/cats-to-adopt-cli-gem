require 'spec_helper'

RSpec.describe CatsToAdopt::Scraper do

    around(:each) do |example|
      VCR.use_cassette("cats_to_adopt", :record => :new_episodes) do
        example.run
      end
    end

    describe ".scrape_main_page" do
      it "creates a bunch of cat instances" do

        CatsToAdopt::Scraper.scrape_main_page('https://la.bestfriends.org/get-involved/adopt/pets?field_animal_species_tid_selective=958')

        expect(CatsToAdopt::Cat.all.size).to be(174)
      end
    end

    describe ".scrape_profile_page" do
      it "scrapes a cat's profile page and returns a hash of cat attributes" do
        attributes = CatsToAdopt::Scraper.scrape_profile_page('https://la.bestfriends.org/get-involved/adopt/pet/12505223')

        expect(attributes).to match({color: "Gray", weight: "0 pounds", age: "10 months 3 weeks"})
      end
    end
end # end scraper spec
