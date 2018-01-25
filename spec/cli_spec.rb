require 'spec_helper'

RSpec.describe CatsToAdopt::CLI do

  let!(:cli) {cli = CatsToAdopt::CLI.new
      allow($stdout).to receive(:puts)
      #cli.call
      cli}

  # after(:each) do
  #   CatsToAdopt::Cat.class_variable_set(:@@all, [])
  # end

  around(:each) do |example|
    VCR.use_cassette("cats_to_adopt") do
      example.run
    end
  end
  # let(:cats){CatsToAdopt::Cat.all}
  #
  # VCR.use_cassette("cats_to_adopt") do
  #   describe "test loading the website" do
  #       response = Net::HTTP.get_response(URI('https://la.bestfriends.org/get-involved/adopt/pets?field_animal_species_tid_selective=958'))
  #     end
  # end

  # describe "#make_cats" do
  #   it "creates an array of cats" do
  #     expect(CatsToAdopt::Cat.all.size).to be > 0
  #     cli.make_cats
  #   end
  # end

  describe "#list_cats" do
    it 'calls print_cats on the Cat class' do
      allow($stdout).to receive(:puts)

      expect(CatsToAdopt::Cat).to receive(:print_cats)

      cli.list_cats
    end
  end

  describe "#menu" do
    it 'loops on invalid input' do
      new_CLI = CatsToAdopt::CLI.new

      allow($stdout).to receive(:puts)
      #expect(new_CLI).to receive(:gets).and_return("invalid")

      #new_CLI.call

      #expect(new_CLI).to receive(:gets).and_return("1")
      #allow($stdin).to receive(:gets).and_return('exit')
      # new_CLI.make_cats
      # new_CLI.list_cats
      # new_CLI.menu
    end
  end

  describe "#goodbye" do
    it 'prints Goodbye!' do
      allow($stdout).to receive(:puts)
    end
  end


end # end cli_spec
