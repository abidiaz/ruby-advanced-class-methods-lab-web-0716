require 'pry'
class Song
  attr_accessor :name, :artist_name, :filename
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name) == false
      new_song = self.new
      new_song.name = name
      new_song.save
      new_song
    else
      self.all.detect{|song| song.name == name}
    end
  end

  def self.alphabetical 
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    new_filename = []
    song = self.new
    new_filename = filename.gsub(".mp3","").split(" - ")
    song.name = new_filename[1]
    song.artist_name = new_filename[0]
    song    
  end

  def self.create_from_filename(filename)
      new_song = self.new
      new_filename = filename.gsub(".mp3","").split(" - ")
      new_song.name = new_filename[1]
      new_song.artist_name = new_filename[0]
      new_song.save
      new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
