require 'slop'
require 'colored'

require 'friction/linter'
require 'friction/version'

# A tool to check your project for common sources of contributor friction.
module Friction
  class << self
    # Sets up command line suite
    def run!(options = {})
      @opts = slop_parse
      @skip = @opts[:skip] || []

      display_version if @opts.version? || options[:version]
      @opts.recursive? || options[:recursive] ? run_checks_recursively : run_checks
    end

    # Sets up Slop
    # @return [Slop] Slop object
    def slop_parse
      Slop.parse help: true, ignore_case: true do
        banner 'Usage: friction [--recursive] [--skip readme:contributing:...]'.blue
        on :s, :skip=, 'Skip check(s).', as: Array, delimiter: ':'
        on :r, :recursive, 'Run checks recursively.'
        on :v, :version, 'Display version.'
      end
    end

    # Runs checks that are not to be skipped
    def run_checks
      display_current_wd
      no_error = true
      checks.each do |check|
        if (send "check_#{check}".to_sym unless @skip.include? check)
          no_error = false
        end
      end
      puts ' Everything is in order!'.green if no_error
    end

    # Runs checks recursively that are not to be skipped
    def run_checks_recursively
      directories = Dir['*'].select { |f| File.directory? f }
      directories.each { |dir| Dir.chdir(dir) { run_checks } }
      if directories.empty?
        display_current_wd
        puts ' No directories found!'.red
      end
    end

    # Displays version
    def display_version
      puts "friction version #{Friction::VERSION}".blue
      exit 0
    end

    private

    def checks
      methods.keep_if { |m| m.match(/^check_/) }.map { |check| check.to_s.gsub 'check_', '' }
    end

    def display_current_wd
      puts "/#{File.basename(Dir.getwd)}".blue.bold
    end
  end
end
