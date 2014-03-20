require 'spec_helper'

describe Friction do
  describe '#run!' do
    it 'lists files that were\'t found' do
      FileUtils.touch 'README.md'
      FileUtils.touch 'LICENSE'

      stdout = capture_stdout { Friction.run! }

      expect(stdout).not_to include 'README'
      expect(stdout).to include 'CONTRIBUTING guide'
      expect(stdout).not_to include 'LICENSE'
      expect(stdout).to include 'Bootstrap script'
      expect(stdout).to include 'Test script'
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
  end

  describe '#check_license' do
    it 'returns true if LICENSE is not found' do
      expect(Friction.check_license).to eq true
    end

    it 'returns nil if LICENSE is found' do
      FileUtils.touch 'LICENSE'
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
  end
end
