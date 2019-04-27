module SafChallenge
  module Parser
    class Content
      include Enumerable

      def initialize(content)
        @content = content
      end

      def each(&block)
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
