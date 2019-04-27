require "saf_challenge/cli/from_file"

module SafChallenge
  module CLI
    class InvalidArgumentError < StandardError; end
    class FileDoesNotExistError < StandardError; end
  end
end
