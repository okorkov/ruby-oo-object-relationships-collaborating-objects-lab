class Song
    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        song_splitted = file_name.split(/[-.]/)
        artist_name = song_splitted[0]
        artist_name = artist_name.split(' ').join(' ')
        song_name = song_splitted[1]
        song_name = song_name.split(' ').join(' ')
        genre = song_splitted[2]
        ns = Song.new(song_name)
        ns.artist_name=(artist_name)
        ns
    end

    def artist_name=(artist_name)
        Artist.find_or_create_by_name(artist_name)
        Artist.all.each do |current_artist|
            if current_artist.name == artist_name
                self.artist = current_artist
            end
        end
    end
end
