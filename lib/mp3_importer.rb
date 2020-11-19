require 'pathname'

class MP3Importer

    def initialize(path)
        @path = path
        import
    end

    def path
        @path
    end

    def files
        Dir.entries(@path).select { |f| File.file? File.join(@path, f) }
    end

    def import 
        array = self.files
        array.each do |song|
            Song.new_by_filename(song)
        end
    end

end

