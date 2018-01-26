require 'spec_helper'

RSpec.describe CatsToAdopt::Cat do

  after(:each) do
    CatsToAdopt::Cat.class_variable_set(:@@all, [])
  end

  let!(:cat) {CatsToAdopt::Cat.new("Kitty McPhee", "2340523", "Male", "Small", "LA")}

  describe "::new" do
    it "creates a new Cat with optional attributes" do
      expect(new_cat = CatsToAdopt::Cat.new("Franklin").id).to match("no id")
    end

    it "adds the new cat to the class variable @@all in class Cat." do
      expect(cat.name).to eq("Kitty McPhee")
      expect(cat.id).to eq("2340523")
      expect(CatsToAdopt::Cat.class_variable_get(:@@all).first.name).to eq("Kitty McPhee")
    end
  end

  describe ".create_from_collection" do
    it "creates new cats with the right attributes & returns them as an array" do
        new_cats = CatsToAdopt::Cat.create_from_collection([{name: "Buzz", size: "Small"}, {name: "Steven", gender: "Male"}])

        expect(new_cats[0].size).to eq("Small")
        expect(new_cats[1].name).to eq("Steven")
    end
  end

  describe ".all" do
    it 'returns the class variable @@all' do
      CatsToAdopt::Cat.class_variable_set(:@@all, [])
      expect(CatsToAdopt::Cat.all).to match_array([])
    end
  end

  describe "#add_cat_attributes" do
    it 'correctly adds new attributes to a cat' do
      attributes = {color: "Blue", weight: "300 lbs", age: "35"}
      cat.add_cat_attributes(attributes)
      expect(cat.color).to eq("Blue")
      expect(cat.weight).to eq("300 lbs")
      expect(cat.age).to eq("35")
    end
  end
end # end cat_spec
