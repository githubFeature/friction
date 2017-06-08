require 'spec_helper'

describe Friction do
  describe '#run!' do
    context 'without recursive flag' do
      it 'lists files that weren\'t found' do
        FileUtils.mkdir '.git'
        FileUtils.touch 'README.md'
        FileUtils.touch 'LICENSE'

        stdout = capture_stdout { Friction.run! }

        expect(stdout).not_to include 'README'
        expect(stdout).to include 'CONTRIBUTING guide'
        expect(stdout).not_to include 'LICENSE'
        expect(stdout).to include 'Bootstrap script'
        expect(stdout).to include 'Test script'
        expect(stdout).to include '.gitignore'
      end
    end

    context 'with recursive flag' do
      it 'lists files that weren\'t found' do
        FileUtils.mkdir 'dir_1'
        FileUtils.touch 'dir_1/README'
        FileUtils.touch 'dir_1/LICENSE'
        FileUtils.mkdir 'dir_2'
        FileUtils.touch 'dir_2/README'
        FileUtils.touch 'dir_2/LICENSE'

        stdout = capture_stdout { Friction.run!(recursive: true) }

        expect(stdout).to include 'dir_1'
        expect(stdout).not_to include 'README'
        expect(stdout).to include 'dir_2'
        expect(stdout).not_to include 'LICENSE'
        expect(stdout).to include 'CONTRIBUTING'
      end
    end
  end

  describe '#check_readme' do
    it 'returns true if README is not found' do
      expect(Friction.check_readme).to eq true
    end

    it 'returns nil if README is found' do
      FileUtils.touch 'README.md'
      expect(Friction.check_readme).to eq nil
    end
  end

  describe '#check_contributing' do
    it 'returns true if CONTRIBUTING guide is not found' do
      expect(Friction.check_contributing).to eq true
    end

    it 'returns nil if CONTRIBUTING guide is found' do
      FileUtils.touch 'CONTRIBUTING.md'
      expect(Friction.check_contributing).to eq nil
    end

    it 'returns nil if .github/CONTRIBUTING guide is found' do
      FileUtils.mkdir '.github'
      FileUtils.touch '.github/CONTRIBUTING.txt'
      expect(Friction.check_contributing).to eq nil
    end
  end

  describe '#check_issue_template' do
    it 'returns true if ISSUE_TEMPLATE is not found' do
      expect(Friction.check_issue_template).to eq true
    end

    it 'returns nil if ISSUE_TEMPLATE is found' do
      FileUtils.touch 'ISSUE_TEMPLATE.md'
      expect(Friction.check_issue_template).to eq nil
    end

    it 'returns nil if .github/ISSUE_TEMPLATE is found' do
      FileUtils.mkdir '.github'
      FileUtils.touch '.github/ISSUE_TEMPLATE.txt'
      expect(Friction.check_issue_template).to eq nil
    end
  end

  describe '#check_pull_request_template' do
    it 'returns true if PULL_REQUEST_TEMPLATE is not found' do
      expect(Friction.check_pull_request_template).to eq true
    end

    it 'returns nil if PULL_REQUEST_TEMPLATE is found' do
      FileUtils.touch 'PULL_REQUEST_TEMPLATE.md'
      expect(Friction.check_pull_request_template).to eq nil
    end

    it 'returns nil if .github/PULL_REQUEST_TEMPLATE is found' do
      FileUtils.mkdir '.github'
      FileUtils.touch '.github/PULL_REQUEST_TEMPLATE.txt'
      expect(Friction.check_pull_request_template).to eq nil
    end
  end

  describe '#check_code_of_conduct' do
    it 'returns true if CODE_OF_CONDUCT guide is not found' do
      expect(Friction.check_code_of_conduct).to eq true
    end

    it 'returns nil if CODE_OF_CONDUCT guide is found' do
      FileUtils.touch 'CODE_OF_CONDUCT.md'
      expect(Friction.check_code_of_conduct).to eq nil
    end
  end

  describe '#check_license' do
    it 'returns true if LICENSE is not found' do
      expect(Friction.check_license).to eq true
    end

    it 'returns nil if LICENSE is found' do
      FileUtils.touch 'LICENSE'
      expect(Friction.check_license).to eq nil
    end

    it 'returns nil if MIT-LICENSE is found' do
      FileUtils.touch 'MIT-LICENSE'
      expect(Friction.check_license).to eq nil
    end

    it 'returns nil if LICENSE.md is found' do
      FileUtils.touch 'LICENSE.md'
      expect(Friction.check_license).to eq nil
    end
  end

  describe '#check_bootstrap' do
    it 'returns true if bootstrap script is not found' do
      expect(Friction.check_bootstrap).to eq true
    end

    it 'returns nil if bootstrap script is found' do
      FileUtils.mkdir 'script'
      FileUtils.touch 'script/bootstrap'
      expect(Friction.check_bootstrap).to eq nil
    end

    it 'returns nil if bootstrap script is found' do
      FileUtils.mkdir 'scripts'
      FileUtils.touch 'scripts/bootstrap'
      expect(Friction.check_bootstrap).to eq nil
    end
  end

  describe '#check_test' do
    it 'returns true if test script is not found' do
      expect(Friction.check_test).to eq true
    end

    it 'returns nil if test script is found' do
      FileUtils.mkdir 'script'
      FileUtils.touch 'script/test'
      expect(Friction.check_test).to eq nil
    end

    it 'returns nil if test script is found' do
      FileUtils.mkdir 'scripts'
      FileUtils.touch 'scripts/test'
      expect(Friction.check_test).to eq nil
    end
  end

  describe '#check_gitignore' do
    it 'returns true if .gitignore is not found (or not Git repository)' do
      expect(Friction.check_gitignore).to eq nil
      FileUtils.mkdir '.git'
      expect(Friction.check_gitignore).to eq true
    end

    it 'returns nil if .gitignore is found (if Git repository)' do
      FileUtils.mkdir '.git'
      FileUtils.touch '.gitignore'
      expect(Friction.check_gitignore).to eq nil
    end
  end
end
