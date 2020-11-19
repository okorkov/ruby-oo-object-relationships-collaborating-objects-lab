class Artist

    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end


    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        @songs << song
        song.artist = self
    end

    def self.find_or_create_by_name(artist)
        found_artist = false
        found_name = nil
        @@all.each do |current_artist|
            if current_artist.name == artist
                found_artist = true
                found_name = current_artist
            else
                found_artist = false
            end
        end
        if found_artist == false
            Artist.new(artist)  
        else
            found_name
        end
    end

    def print_songs
        list = []
        @songs.each do |song|
            list << song.name 
        end
        puts list
    end

end

