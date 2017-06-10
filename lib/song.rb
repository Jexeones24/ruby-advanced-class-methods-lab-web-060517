require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    newsong=Song.new
    newsong.save
    newsong
  end

  def self.new_by_name(name)
    newsong=Song.new
    newsong.name=(name)
    newsong
  end

  def self.create_by_name(name)
    newsong=Song.new
    newsong.name=(name)
    newsong.save
    newsong
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song_data = filename.split(" - ")
      artist = song_data[0]
      song_title = song_data[1].chomp(".mp3")

      song = Song.new
      song.name = song_title
      song.artist_name = artist
      song
  end
  #given "Taylor Swift - Blank Space.mp3"
  #parse into:
  #artist_name: "Taylor Swift"
  #song_name: "Blank Space.mp3"
  #split at '-'
  #remove .mp3

  def self.create_from_filename(filename)
    song_data = filename.split(" - ")
      artist = song_data[0]
      song_title = song_data[1].chomp(".mp3")

      song = Song.new
      song.name = song_title
      song.artist_name = artist
      song.save
  end

  def self.destroy_all
    @@all.clear
  end


end
