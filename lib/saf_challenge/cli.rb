require "saf_challenge/cli/handle_input"

module SafChallenge
  module CLI
    class InvalidArgumentError < StandardError; end
    class FileDoesNotExistError < StandardError; end
  end
end
