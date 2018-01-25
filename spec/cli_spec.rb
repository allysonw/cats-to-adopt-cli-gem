require 'spec_helper'

RSpec.describe CatsToAdopt::CLI do

  # If these cassettes are deleted or VCR generates new cassettes this data will
  # need to be updated from  https://la.bestfriends.org/get-involved/adopt/pets?field_animal_species_tid_selective=958
  around(:each) do |example|
    VCR.use_cassette("cats_to_adopt") do
      example.run
    end
  end

  after(:each) do
    CatsToAdopt::Cat.class_variable_set(:@@all, [])
  end

  let!(:cats){CatsToAdopt::Cat.all}

  describe "#make_cats" do
    it "creates an array of cats" do
      CatsToAdopt::CLI.new.make_cats
      expect(cats.size).to be > 0
    end
  end

  describe "#list_cats" do
    it 'calls print_cats on the Cat class' do
      expect(CatsToAdopt::Cat).to receive(:print_cats)
      CatsToAdopt::CLI.new.list_cats
    end
  end

  describe "#goodbye" do
    it 'prints Goodbye!' do
      allow($stdout).to receive(:puts)
    end
  end
end # end cli spec
