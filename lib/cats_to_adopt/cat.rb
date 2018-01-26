class CatsToAdopt::Cat
  attr_accessor :name, :gender, :size, :location, :profile_url, :id, :age, :color, :weight

  @@all = []

  # INSTANCE METHODS
  # create a new cat with the basic attributes & save it to @@all
  def initialize(name, id ="no id", gender = "no gender", size = "no size", location = "no location")
    @name = name
    @id = id
    @gender = gender
    @size = size
    @location = location
    @@all << self
  end

  # set additional attributes on a cat
  def add_cat_attributes(attributes)
    self.color = attributes[:color]
    self.weight = attributes[:weight]
    self.age = attributes[:age]
    self.profile_url = 'https://la.bestfriends.org/get-involved/adopt/pet/' + self.id
  end

  # prints detailed information for a cat
  def print_cat_info
    puts "\nCat Name: #{self.name}"
    puts "-- ID: #{self.id}"
    puts "-- Gender: #{self.gender}"
    puts "-- Age: #{self.age}"
    puts "-- Color: #{self.color}"
    puts "-- Size: #{self.size}"
    puts "-- Weight: #{self.weight}"
    puts "-- Location: #{self.location}"
    puts "-- Profile Link: #{self.profile_url}\n"
  end

  # CLASS METHODS

  # takes an array of hashes of attributes and returns an array of new Cats
  # with these attributes
  def self.create_from_collection(cat_attributes)
    cat_attributes.collect do |attributes_hash|
      new_cat = self.new(attributes_hash[:name], attributes_hash[:id], attributes_hash[:gender], attributes_hash[:size], attributes_hash[:location])
    end
  end

  def self.all
    @@all
  end

  def self.print_cats
    puts "\nCats available now:"

    self.all.each.with_index(1) do |cat, i|
      puts "#{i}. #{cat.name} - #{cat.gender} - #{cat.size}"
    end
  end

end # end Cat class
