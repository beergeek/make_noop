metadata :name => "make_noop",
         :description => "Agent to enabled and disable noop",
         :author => "Brett Gray",
         :license => "Apache",
         :version => "0.1.0",
         :url => "http://puppet.com",
         :timeout => 20

action "enable_noop", :description => "Enable noop mode globally" do
  output  :out,
	  :description => "Confirmation",
	  :display_as  => "Return"
end

action "disable_noop", :description => "Enable noop mode globally" do
  output  :out,
	  :description => "Confirmation",
	  :display_as  => "Return"
end
