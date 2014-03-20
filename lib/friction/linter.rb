module Friction
  class << self
    # Checks/logs if README exists
    # @return [nil,true] nil if file exists, true if not
    def check_readme
      log 'README not found.' unless check? 'README*'
    end

    # Checks/logs if CONTRIBUTING guide exists
    # @return [nil,true] nil if file exists, true if not
    def check_contributing
      log 'CONTRIBUTING guide not found.' unless check? 'CONTRIBUTING*'
    end

    # Checks/logs if LICENSE exists
    # @return [nil,true] nil if file exists, true if not
    def check_license
      log 'LICENSE not found.' unless check? 'LICENSE*'
    end

    # Checks/logs if bootstrap script exists
    # @return [nil,true] nil if file exists, true if not
    def check_bootstrap
      log 'Bootstrap script not found.' unless check? 'script/bootstrap'
    end

    # Checks/logs if test script exists
    # @return [nil,true] nil if file exists, true if not
    def check_test
      log 'Test script not found.' unless check? 'script/test'
    end

    private

    def check?(filename)
      !Dir.glob(filename).empty?
    end

    def log(message)
      puts "[#{'ERROR'.red}] #{message.blue}"
      true
    end
  end
end
