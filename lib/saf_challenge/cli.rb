module SafChallenge
  class CLI
    def initialize(argv)
      @argv = argv
    end

    def content
      File.read(argv.first)
    end

    private

    attr_accessor :argv
  end
end
