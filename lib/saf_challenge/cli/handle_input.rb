module SafChallenge
  module CLI
    class HandleInput
      def self.call(argv = [])
        new(argv).call
      end

      def initialize(argv)
        raise InvalidArgumentError unless argv.count == 1

        @argv = argv
      end

      def call
        raise FileDoesNotExistError unless File.exists?(filename)

        File.read(filename)
      end

      private

      def filename
        argv.first
      end

      attr_accessor :argv
    end
  end
end
