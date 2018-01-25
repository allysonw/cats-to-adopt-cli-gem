require 'spec_helper'

RSpec.describe CatsToAdopt::CLI do

  around(:each) do |example|
    VCR.use_cassette("cats_to_adopt") do
      example.run
    end
  end

  after(:each) do
    CatsToAdopt::Cat.class_variable_set(:@@all, [])
  end

  # let!(:cli) {cli = CatsToAdopt::CLI.new
  #     allow($stdout).to receive(:puts)
  #     cli}

  let!(:cats){CatsToAdopt::Cat.all}

  # VCR.use_cassette("cats_to_adopt") do
  #   describe "test loading the website" do
  #       response = Net::HTTP.get_response(URI('https://la.bestfriends.org/get-involved/adopt/pets?field_animal_species_tid_selective=958'))
  #     end
  # end

  describe "#make_cats" do
    it "creates an array of cats" do
      CatsToAdopt::CLI.new.make_cats
      expect(cats.size).to be > 0
    end
  end

  describe "#list_cats" do
    it 'calls print_cats on the Cat class' do
      #allow($stdout).to receive(:puts)
      expect(CatsToAdopt::Cat).to receive(:print_cats)
      CatsToAdopt::CLI.new.list_cats

    end
  end

    describe "#goodbye" do
    it 'prints Goodbye!' do
      allow($stdout).to receive(:puts)
    end
  end


end # end cli_spec
