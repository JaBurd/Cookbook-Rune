action :install do
  g = gem_package new_resource.name do
    gem_binary Artifactory::Resource.gem_binary
    version new_resource.version
    options new_resource.options
  end

  new_resource.updated_by_last_action(g.updated_by_last_action?)
end

action :remove do
  g = gem_package new_resource.name do
    gem_binary Artifactory::Resource.gem_binary
    version new_resource.version
    action :remove
  end

  new_resource.updated_by_last_action(g.updated_by_last_action?)
end
