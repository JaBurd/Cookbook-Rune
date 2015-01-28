chef_gem "artifactory" do
  action :nothing
end.run_action(:install)
Gem.clear_paths

require 'artifactory'
