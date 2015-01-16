attr_reader :extension
attr_reader :file_name

def load_current_resource
  @current_resource = Chef::Resource::ArtifactPackage.new(@new_resource.name)
  @current_resource
end

action :install do

  pkg = ::File.join(Chef::Config[:file_cache_path],
                    "artifact_packages",
                    file_name)

  directory ::File.dirname(pkg) do
    action :create
    recursive true
  end

  artifact_file pkg do
    location new_resource.location
    checksum new_resource.checksum if new_resource.checksum
    owner new_resource.owner
    group new_resource.group
    nexus_configuration nexus_configuration_object if Chef::Artifact.from_nexus?(new_resource.location)
    download_retries new_resource.download_retries
    after_download new_resource.after_download
  end

  package new_resource.name do
    source pkg
    action :install
  end
end