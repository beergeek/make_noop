module MCollective
  class Application
    class Upgrade_pe < MCollective::Application
      description 'Upgrade PE agent'

      option  :master,
              :description  => 'URL of master',
              :arguments   => ['-m URL','--master MASTER'],
              :type        => String,
              :required    => true

      def main
        mc = rpcclient('upgrade_pe')

        output = mc.upgrade(:master => configuration[:master])

        sender_width = output.map{|s| s[:sender]}.map{|s| s.length}.max + 3

        output.each do |result|
          pattern = "%%%ds: %%s" % sender_width
    if result[:data][:out] == true
            out = "Cron job created to upgraded"
          else
            out = "Cron failed!"
          end
          puts(pattern % [result[:sender], out])

        end

        printrpcstats
      end
    end
  end
end
