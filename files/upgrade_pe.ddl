metadata :name => "upgrade_pe",
         :description => "Agent to upgrade PE on Linux nodes",
         :author => "Brett Gray",
         :license => "Apache",
         :version => "0.1.0",
         :url => "http://puppet.com",
         :timeout => 60

action "upgrade", :description => "Upgrade Agent" do
  input   :master,
    :prompt       => 'Master',
    :description  => 'Master to upgrade against',
    :type         => :string,
    :validation   => '\w+',
    :optional     => false,
    :maxlength    => 50

  output  :out,
	  :description => "Confirmation",
	  :display_as  => "Return"
end

