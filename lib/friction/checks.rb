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
      unless check? 'CONTRIBUTING*', '.github/CONTRIBUTING*'
        log 'CONTRIBUTING guide not found', 'g_0mVQ'
      end
    end

    # Checks/logs if ISSUE_TEMPLATE exists
    # @return [nil,true] nil if file exists, true if not
    def check_issue_template
      unless check? 'ISSUE_TEMPLATE*', '.github/ISSUE_TEMPLATE*'
        log 'ISSUE_TEMPLATE not found', 'vgpaA'
      end
    end

    # Checks/logs if PULL_REQUEST_TEMPLATE exists
    # @return [nil,true] nil if file exists, true if not
    def check_pull_request_template
      unless check? 'PULL_REQUEST_TEMPLATE*', '.github/PULL_REQUEST_TEMPLATE*'
        log 'PULL_REQUEST_TEMPLATE not found', 'vgpVk'
      end
    end

    # Checks/logs if CODE_OF_CONDUCT exists
    # @return [nil,true] nil if file exists, true if not
    def check_code_of_conduct
      log 'CODE_OF_CONDUCT guide not found', 'vJvR3' unless check? 'CODE_OF_CONDUCT*'
    end

    # Checks/logs if LICENSE exists
    # @return [nil,true] nil if file exists, true if not
    def check_license
      log 'LICENSE not found', 'pFMQMQ' unless check? '*LICENSE*'
    end

    # Checks/logs if bootstrap script exists
    # @return [nil,true] nil if file exists, true if not
    def check_bootstrap
      log 'Bootstrap script not found', 'jZoRYA' unless check? 'script/bootstrap*'
    end

    # Checks/logs if test script exists
    # @return [nil,true] nil if file exists, true if not
    def check_test
      log 'Test script not found', 'oo21Jw' unless check? 'script/test*'
    end

    # Checks/logs if .gitignore exists (if directory is Git repository)
    # @return [nil,true] nil if file exists, true if not
    def check_gitignore
      if check? '.git'
        log '.gitignore not found', 'pevJkA' unless check? '.gitignore'
      end
    end

    private

    def check?(*filenames)
      filenames.each { |f| return true if !Dir[f].empty? }
      false
    end

    def log(message, source, type = 'ERROR')
      puts format(' [%s] %-40s see http://git.io/%s', type.red, message.blue, source)
      true
    end
  end
end
