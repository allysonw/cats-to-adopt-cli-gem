require 'spec_helper'

RSpec.describe CatsToAdopt::Cat do

  after(:each) do
    CatsToAdopt::Cat.class_variable_set(:@@all, [])
  end

  let!(:cat) {cat = CatsToAdopt::Cat.new
     cat.name = "Kitty McPhee"
     cat.id = "2304238"
     cat.gender = "Male"
     cat.size = "Small"
     cat.location = "Los Angeles"
     cat}

  describe "::new" do
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
