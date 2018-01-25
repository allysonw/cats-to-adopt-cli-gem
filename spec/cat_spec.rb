require 'spec_helper'

RSpec.describe CatsToAdopt::Cat do

  let!(:cat) {cat = CatsToAdopt::Cat.new
     cat.name = "Kitty McPhee"
     cat.id = "2304238"
     cat.gender = "Male"
     cat.size = "Small"
     cat.location = "Los Angeles"
     cat}

  # after(:each) do
  #   CatsToAdopt::Cat.class_variable_set(:@@all, [])
  # end

  describe "#new" do
    it "creates a new Cat." do
      expect{new_cat = CatsToAdopt::Cat.new; new_cat.name = "Franklin"}.to_not raise_error
    end

    it "adds the new cat to the class variable @@all in class Cat." do
      expect(cat.name).to eq("Kitty McPhee")
      expect(cat.id).to eq("2304238")
      expect(CatsToAdopt::Cat.class_variable_get(:@@all).first.name).to eq("Kitty McPhee")
    end
  end

  describe "#all" do
    it "returns an array of all the cats" do
      expect(true).to eq(false)
    end
  end

  describe "#scrape_cats" do
    it 'correctly scrapes cat info for the cats' do
      expect(true).to eq(false)
    end
  end

  describe "#print_cat_info" do
    it 'correctly scrapes cat info for the cats' do
      expect(true).to eq(false)
    end
  end

  describe "#list_cats" do
    it 'lists info for all the cats' do
      expect(true).to eq(false)
    end
  end

end # end spec
