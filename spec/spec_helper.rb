require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
])
SimpleCov.start { add_filter '/spec/' }

$LOAD_PATH.unshift(File.dirname(File.realpath(__FILE__)) + '/../lib')
require 'friction'

require 'fakefs/spec_helpers'

RSpec.configure do |config|
  config.include FakeFS::SpecHelpers
  config.before(:all) { $stdout = File.new('/dev/null', 'w') }
  config.expect_with(:rspec) { |c| c.syntax = :expect }
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

def capture_stdout(&block)
  old = $stdout
  $stdout = fake = StringIO.new
  block.call
  fake.string
ensure
  $stdout = old
end
