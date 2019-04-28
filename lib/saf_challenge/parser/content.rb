module SafChallenge
  module Parser
    class Content
      class EmptyContentError < StandardError; end

      include Enumerable

      def initialize(content)
        @content = content
      end

      def each(&block)
        raise EmptyContentError if content.empty?

        content.each_line { |line| block.call(parse_line(line)) }
      end

      private

      attr_accessor :content

      def parse_line(line)
        Parser::Line.call(line)
      end
    end
  end
end
