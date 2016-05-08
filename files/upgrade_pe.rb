#
# MCO Agent to upgrade PE agents on *nix nodes
# Written by Brett Gray
# brett.gray@puppet.com
#
require 'puppet'
module MCollective
  module Agent
    class Upgrade_pe < RPC::Agent

      activate_when do
        true
      end

      def startup_hook
        @configfile = @config.pluginconf.fetch("puppet.config", nil)
      end

      def resource_manage(resource_type, resource_name, cmd_hash)
        begin
          x = ::Puppet::Resource.new(resource_type, resource_name, :parameters => cmd_hash)
          result = ::Puppet::Resource.indirection.save(x)
          Log.info("#{cmd_hash} the resource of #{resource_type} with the title #{resource_name}: #{result}")
        rescue => e
          raise "Could not manage resource of #{resource_type} with the title #{resource_name}: #{e.to_s}"
        end
      end

      action 'upgrade' do
        t = Time.now + (2*60)
        reply[:out] = resource_manage('cron','upgrade_pe',{'ensure' => 'present','command' => "/opt/puppetlabs/bin/puppet resource cron upgrade_pe ensure=absent; curl -k  https://#{request[:master]}:8140/packages/current/install.bash | sudo bash",'user' => 'root','hour' => t.hour, 'minute' => t.min})
      end

    end
  end
end
