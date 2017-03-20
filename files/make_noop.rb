#
# MCO Agent to enable or disable noop mode globally
# Written by Brett Gray
# brett.gray@puppet.com
#
require 'puppet'

module MCollective
  module Agent
    class Make_noop < RPC::Agent

      activate_when do
        require 'mcollective/util/puppet_agent_mgr'
        true
      end

      def startup_hook
        @configfile = @config.pluginconf.fetch("puppet.config", nil)
      end

      def resource_manage(resource_type, resource_name, cmd_hash)
        begin
          x = ::Puppet::Resource.new(resource_type, resource_name, :parameters => cmd_hash)
          result, report = ::Puppet::Resource.indirection.save(x)
          report.finalize_report
          Log.info("#{cmd_hash} the resource of #{resource_type} with the title #{resource_name}: #{report.exit_status}")
        rescue => e
          Log.debug "Could not manage resource of #{resource_type} with the title #{resource_name}: #{report.exit_status}")
          raise "Could not manage resource of #{resource_type} with the title #{resource_name}: #{e.to_s}"
        end
      end

      action 'enable_noop' do
        reply[:out] = resource_manage('ini_setting', 'noop', {'ensure' => 'present','path' => @configfile,'section' => 'agent','setting' => 'noop', 'value' => 'true'})
      end

      action 'disable_noop' do
        reply[:out] = resource_manage('ini_setting', 'noop', {'ensure' => 'present','path' => @configfile,'section' => 'agent','setting' => 'noop', 'value' => 'false'})
      end
    end
  end
end
