module SafChallenge
  module Parser
    class Line
      LINE_REGEX = /^(?<quantity>\d*) (?<imported>(imported )?)(?<description>.*) at (?<cost>[0-9]+(\.[0-9]{1,2})?)$/

      def self.call(line)
        new(line).call
      end

      def initialize(line)
        @line = line
      end

      def call
        matched = line.match(LINE_REGEX)

        raise InvalidLineError if matched.nil?
      end

      private

      attr_accessor :line
    end
  end
end
