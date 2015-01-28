require_relative '../libraries/helpers'
include Rune::Helpers
attr_reader :extension
attr_reader :file_name


#load_current_resource

action :install do

  pkg = ::File.join(Chef::Config[:file_cache_path],
                    "artifact_packages",
                    new_resource.file_name)

  directory ::File.dirname(pkg) do
    action :create
    recursive true
  end

  artifact_file pkg do
    location new_resource.location
    checksum new_resource.checksum if new_resource.checksum
    owner new_resource.owner
    group new_resource.group
  end

  package new_resource.name do
    source pkg
    action :install
  end
end