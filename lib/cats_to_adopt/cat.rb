class CatsToAdopt::Cat
  attr_accessor :name, :gender, :size, :location, :profile_url, :id, :age, :color, :weight

  @@all = []

  # Initialize
  def initialize
    @@all << self
  end

  # CLASS METHODS
  def self.all
    @@all
  end

  def self.print_cats
    puts "\nCats available now:"

    self.all.each.with_index(1) do |cat, i|
      puts "#{i}. #{cat.name} - #{cat.gender} - #{cat.size}"
    end
  end

  # def self.find_cat_by_id(id)
  #   return 37673447
  # end

  # def self.create_from_collection(cats_array)
  #   cats_array.each do |cat|
  #     Cat.new(cat)
  # end

  # INSTANCE METHODS

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
end
