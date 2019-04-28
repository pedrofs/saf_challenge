# SafChallenge

A program written for the [SAF challenge](https://gist.github.com/safplatform/792314da6b54346594432f30d5868f36)

It was chosen to write it as a gem due to easy rspec setup.

The program has a executable to allow you to run it from command line.

The program exposes a public API. It means you can use the executable or use the underlying API to run it in a more customizable way. Check `bin/saf_challenge`

## Installation

Despite the program is developed as a ruby gem and you can install it using Gemfile basically. It is recommended to clone the repo:

```
$ git clone git@github.com:pedrofs/saf_challenge.git
```

And run rake install:

```
$ rake install
```

## Usage

```
$ bin/saf_challenge input.txt
```

## Improvement

Currently the executable is not rescuing from these application execeptions:
```
SafChallenge::CLI::FromFile::InvalidArgumentError
SafChallenge::CLI::FromFile::FileDoesNotExistError
SafChallenge::Parser::Content::EmptyContentError
