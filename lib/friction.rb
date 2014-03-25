require 'slop'
require 'colored'

require 'friction/linter'
require 'friction/version'

# A tool to check your project for common sources of contributor friction.
module Friction
  class << self
    # Sets up command line suite
    def run!
      @opts = slop_parse
      @skip = @opts[:skip] || []

      display_version if @opts.version?
      run_checks
    end

    # Sets up Slop
    # @return [Slop] Slop object
    def slop_parse
      Slop.parse help: true, ignore_case: true do
        banner 'Usage: friction [--skip readme:contributing:...]'.blue
        on :s, :skip=, 'Skip check(s).', as: Array, delimiter: ':'
        on :v, :version, 'Display version.'
      end
    end

    # Runs checks that are not to be skipped
    def run_checks
      methods.keep_if { |m| m.match(/^check_/) }.each do |check|
        send check.to_sym unless @skip.include? check.to_s.sub 'check_', ''
      end
    end

    # Displays version
    def display_version
      puts "friction version #{Friction::VERSION}".blue
      exit 0
    end
  end
end
