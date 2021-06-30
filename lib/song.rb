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
  song = Song.new
  song.save
  song
  end

  def self.new_by_name(name)
  song = Song.create
  song.name = name
  song
  end

def self.find_by_name name
  @@all.find {|song| song.name == name}
end

def self.create_by_name(name) 
@@all << Song.new_by_name(name)
 Song.find_by_name name
end

def self.find_or_create_by_name name
result = Song.find_by_name name 
result != nil ? result : Song.new_by_name(name)
end 

def self.alphabetical 
 @@all.sort {|a,b| a.name <=> b.name}.uniq
end

def self.create_from_filename file_scope
song = Song.new
info = file_scope.split("-")
song.name = info[1].sub(".mp3", "").strip!
song.artist_name = info[0].strip!
song.save
song
end 

def self.destroy_all
 @@all.clear
end


end
