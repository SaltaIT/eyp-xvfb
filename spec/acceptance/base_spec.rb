require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'xvfb class' do

  context 'basic setup' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'xvfb':
        listen_tcp => false,
      }

      xvfb::instance { ':15':
      }

      xvfb::instance { ':16':
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

  end
end
