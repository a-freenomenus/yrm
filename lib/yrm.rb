$LOAD_PATH << Pathname.new(".").join("lib").realpath

require "yrm/storage"
require "yrm/resolver"

module YRM
  class << self
    def current
      @current ||= YRM::Storage.new(@path)
    end

    def path=(new_path)
      @path = new_path
    end

    private
    def path
      raise "No path given" if @path.nil?
    end
  end
end
