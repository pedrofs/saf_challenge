require 'ostruct'

module SafChallenge
  module Parser
    class Line
      class InvalidLineError < StandardError; end

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

        build_parsed_line(matched)
      end

      private

      def build_parsed_line(matched)
        OpenStruct.new(quantity: matched[:quantity].to_i,
                       imported: !matched[:imported].empty?,
                       description: description(matched),
                       cost: matched[:cost].to_f)
      end

      def description(matched)
        "#{matched[:imported]}#{matched[:description]}"
      end

      attr_accessor :line
    end
  end
end
