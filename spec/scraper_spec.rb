require 'spec_helper'

RSpec.describe CatsToAdopt::Scraper do

    around(:each) do |example|
      VCR.use_cassette("cats_to_adopt") do
        example.run
      end
    end

    after(:each) do
       CatsToAdopt::Cat.class_variable_set(:@@all, [])
    end
    #
    # let!(:cli) {cli = CatsToAdopt::CLI.new
    #       allow($stdout).to receive(:puts)
    #       cli.make_cats
    #       cli }
    #
    # let!(:cats){CatsToAdopt::Cat.all}

    describe ".scrape_main_page" do
      it "creates a bunch of cat instances" do

        CatsToAdopt::Scraper.scrape_main_page('https://la.bestfriends.org/get-involved/adopt/pets?field_animal_species_tid_selective=958')

        expect(CatsToAdopt::Cat.all.size).to be(177)
      end
    end

end
