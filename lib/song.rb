require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new()
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new()
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song.save
    new_song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by {|a| a.name}
  end

  def self.new_from_filename(fileName)
<<<<<<< HEAD
    #binding.pry
    split_file = fileName.split("-")
    s_name = split_file[1].lstrip.gsub(".mp3", "")
    song = Song.new
    song.artist_name = split_file[0].strip
    song.name = s_name
    return song
=======
    split_file = fileName.split("-")
    s_name = split_file[1].gsub(".mp3", "")
    song = Song.new
    song.artist_name = split_file[0]
    song.name = s_name
    #binding.pry
>>>>>>> e474d8c39e3bfe5db0aaa7469f186ad39e0f0d48
  end

  def self.create_from_filename(fileName)
    @@all << self.new_from_filename(fileName)
    @@all.last
  end

  def self.destroy_all
    @@all.clear
  end

end
