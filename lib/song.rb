

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

#instantiates and saves the song, and it returns the new song that was created
  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
      self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
        self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end


  def self.new_from_filename(file)
    rows = file.chop.chop.chop.chop.split(" - ")
    song = self.new
    song.name = rows[1]
    song.artist_name = rows[0]
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save

  end


  def self.destroy_all
    @@all.clear
  end

end
