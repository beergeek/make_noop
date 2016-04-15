require 'spec_helper'

describe 'make_noop' do
  let(:pre_condition) { 'service { mcollective: }' }

  context 'On Linux with defaults' do
    let(:facts) do
      {
        :kernel     => 'Linux'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('make_noop') }

    it { is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/agent/make_noop.rb').with(
      'ensure'  => 'file',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
      'source'  => 'puppet:///modules/make_noop/make_noop.rb',
      ).that_notifies('Service[mcollective]')
    }

    it { is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/agent/make_noop.ddl').with(
      'ensure'  => 'file',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
      'source'  => 'puppet:///modules/make_noop/make_noop.ddl',
      ).that_notifies('Service[mcollective]')
    }

    it { is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/application/enable_noop.rb').with(
      'ensure'  => 'absent',
      )
    }

    it { is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/application/disable_noop.rb').with(
      'ensure'  => 'absent',
      )
    }
  end

  context 'On Linux with application also selected' do
    let(:facts) do
      {
        :kernel     => 'Linux'
      }
    end
    let(:params) do
      {
        :include_app => true,
      }
    end

    it { is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/agent/make_noop.rb').with(
      'ensure'  => 'file',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
      'source'  => 'puppet:///modules/make_noop/make_noop.rb',
      ).that_notifies('Service[mcollective]')
    }

    it { is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/agent/make_noop.ddl').with(
      'ensure'  => 'file',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
      'source'  => 'puppet:///modules/make_noop/make_noop.ddl',
      ).that_notifies('Service[mcollective]')
    }

    it { is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/application/enable_noop.rb').with(
      'ensure'  => 'file',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
      'source'  => 'puppet:///modules/make_noop/enable_noop.rb',
      )
    }

    it { is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/application/disable_noop.rb').with(
      'ensure'  => 'file',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
      'source'  => 'puppet:///modules/make_noop/disable_noop.rb',
      )
    }

  end

  context "On Linux wiht all deselected" do
    let(:facts) do
      {
        :kernel     => 'Linux'
      }
    end
    let(:params) do
      {
        :include_app   => false,
        :include_agent => false,
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('make_noop') }

    it { is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/agent/make_noop.rb').with(
      'ensure'  => 'absent',
      ).that_notifies('Service[mcollective]')
    }

    it { is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/agent/make_noop.ddl').with(
      'ensure'  => 'absent',
      ).that_notifies('Service[mcollective]')
    }

    it { is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/application/enable_noop.rb').with(
      'ensure'  => 'absent',
      )
    }

    it { is_expected.to contain_file('/opt/puppetlabs/mcollective/plugins/mcollective/application/disable_noop.rb').with(
      'ensure'  => 'absent',
      )
    }
  end

  context 'On Windoz with defaults' do
    let(:facts) do
      {
        :kernel     => 'Windows'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('make_noop') }

    it { is_expected.to contain_file('C:/ProgramData/puppetlabs/mcollective/plugins/mcollective/agent/make_noop.rb').with(
      'ensure'  => 'file',
      'owner'   => 'S-1-5-32-544',
      'group'   => 'S-1-5-32-544',
      'mode'    => '0664',
      'source'  => 'puppet:///modules/make_noop/make_noop.rb',
      ).that_notifies('Service[mcollective]')
    }

    it { is_expected.to contain_file('C:/ProgramData/puppetlabs/mcollective/plugins/mcollective/agent/make_noop.ddl').with(
      'ensure'  => 'file',
      'owner'   => 'S-1-5-32-544',
      'group'   => 'S-1-5-32-544',
      'mode'    => '0664',
      'source'  => 'puppet:///modules/make_noop/make_noop.ddl',
      ).that_notifies('Service[mcollective]')
    }

  end

  context 'On Windoz with application also selected' do
    let(:facts) do
      {
        :kernel     => 'Windows'
      }
    end
    let(:params) do
      {
        :include_app => true,
      }
    end

    it { is_expected.to contain_file('C:/ProgramData/puppetlabs/mcollective/plugins/mcollective/agent/make_noop.rb').with(
      'ensure'  => 'file',
      'owner'   => 'S-1-5-32-544',
      'group'   => 'S-1-5-32-544',
      'mode'    => '0664',
      'source'  => 'puppet:///modules/make_noop/make_noop.rb',
      ).that_notifies('Service[mcollective]')
    }

    it { is_expected.to contain_file('C:/ProgramData/puppetlabs/mcollective/plugins/mcollective/agent/make_noop.ddl').with(
      'ensure'  => 'file',
      'owner'   => 'S-1-5-32-544',
      'group'   => 'S-1-5-32-544',
      'mode'    => '0664',
      'source'  => 'puppet:///modules/make_noop/make_noop.ddl',
      ).that_notifies('Service[mcollective]')
    }

    it { is_expected.to contain_file('C:/ProgramData/puppetlabs/mcollective/plugins/mcollective/application/enable_noop.rb').with(
      'ensure'  => 'file',
      'owner'   => 'S-1-5-32-544',
      'group'   => 'S-1-5-32-544',
      'mode'    => '0664',
      'source'  => 'puppet:///modules/make_noop/enable_noop.rb',
      )
    }

    it { is_expected.to contain_file('C:/ProgramData/puppetlabs/mcollective/plugins/mcollective/application/disable_noop.rb').with(
      'ensure'  => 'file',
      'owner'   => 'S-1-5-32-544',
      'group'   => 'S-1-5-32-544',
      'mode'    => '0664',
      'source'  => 'puppet:///modules/make_noop/disable_noop.rb',
      )
    }

  end

  context 'On Windoz with all deselected' do
    let(:facts) do
      {
        :kernel     => 'Windows'
      }
    end
    let(:params) do
      {
        :include_app   => false,
        :include_agent => false,
      }
    end

    it { is_expected.to contain_file('C:/ProgramData/puppetlabs/mcollective/plugins/mcollective/agent/make_noop.rb').with(
      'ensure'  => 'absent',
      'source'  => 'puppet:///modules/make_noop/make_noop.rb',
      ).that_notifies('Service[mcollective]')
    }

    it { is_expected.to contain_file('C:/ProgramData/puppetlabs/mcollective/plugins/mcollective/agent/make_noop.ddl').with(
      'ensure'  => 'absent',
      'source'  => 'puppet:///modules/make_noop/make_noop.ddl',
      ).that_notifies('Service[mcollective]')
    }

    it { is_expected.to contain_file('C:/ProgramData/puppetlabs/mcollective/plugins/mcollective/application/enable_noop.rb').with(
      'ensure'  => 'absent',
      'source'  => 'puppet:///modules/make_noop/enable_noop.rb',
      )
    }

    it { is_expected.to contain_file('C:/ProgramData/puppetlabs/mcollective/plugins/mcollective/application/disable_noop.rb').with(
      'ensure'  => 'absent',
      'source'  => 'puppet:///modules/make_noop/disable_noop.rb',
      )
    }

  end
end
