module Friction
  class << self
    # Checks/logs if README exists
    # @return [nil,true] nil if file exists, true if not
    def check_readme
      log 'README not found', 'yHosNA' unless check? 'README*'
    end

    # Checks/logs if CONTRIBUTING guide exists
    # @return [nil,true] nil if file exists, true if not
    def check_contributing
      log 'CONTRIBUTING guide not found', 'g_0mVQ' unless check? 'CONTRIBUTING*'
    end

    # Checks/logs if LICENSE exists
    # @return [nil,true] nil if file exists, true if not
    def check_license
      log 'LICENSE not found', 'pFMQMQ' unless check? 'LICENSE*'
    end

    # Checks/logs if bootstrap script exists
    # @return [nil,true] nil if file exists, true if not
    def check_bootstrap
      log 'Bootstrap script not found', 'jZoRYA' unless check? 'script/bootstrap'
    end

    # Checks/logs if test script exists
    # @return [nil,true] nil if file exists, true if not
    def check_test
      log 'Test script not found', 'oo21Jw' unless check? 'script/test'
    end

    # Checks/logs if .gitignore exists (if directory is Git repository)
    # @return [nil,true] nil if file exists, true if not
    def check_gitignore
      if check? '.git'
        log '.gitignore not found', 'pevJkA' unless check? '.gitignore'
      end
    end

    private

    def check?(filename)
      !Dir[filename].empty?
    end

    def log(message, source)
      puts "[#{'ERROR'.red}] #{message.blue} (see http://git.io/#{source})"
      true
    end
  end
end
