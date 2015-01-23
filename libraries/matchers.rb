if defined?(ChefSpec)
  #config
  def create_rune_config(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:rune_config, :create, resource_name)
  end
end