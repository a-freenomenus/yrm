require "yaml"
require "pathname"

module YRM
  class Storage
    class Error < StandardError
      attr_reader :message

      def initialize(message)
        @message = message
      end
    end

    attr_reader :storage

    def initialize(path)
      @path = Pathname.new(path)
      @storage = {}

      validate_path!
      load!
    end

    def save!
     error "File '#@path' must be writable" if not @path.writable?

     File.open(@path, "w") do |file|
       YAML.dump(@storage, file)
     end
    rescue => e
      error "Can't save state to '#@path': #{e}"
    end

    def empty!
      @storage = {}
    end

    def classes
      @storage.keys.map(&:to_sym).map(&:capitalize)
    end

    def inspect
      "<YRM::Storage Keys: #{@storage.keys}>"
    end
    alias_method :to_s, :inspect

    private
    def load!
      @storage = YAML.load_file(@path)
    rescue => e
      error "Unable to load YAML file: #{e}"
    end

    def validate_path!
      error "File does not exists: #@path" if not @path.exist?
      @path = @path.realpath

      error "'#@path' must be a file" if not @path.file?
      error "File '#@path' must be readable" if not @path.readable?
      error "File '#@path' must be writable" if not @path.writable?
    end

    def error(message)
      raise Error.new(message)
    end
  end
end
