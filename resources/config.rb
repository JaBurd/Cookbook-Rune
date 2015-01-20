require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class RuneConfig < Chef::Resource::LWRPBase
      self.resource_name = :rune_config
      actions :create, :update, :delete
      default_action :create

      attribute :endpoint, kind_of: String, name_attribute: true, required: true
      attribute :username, kind_of: String, required: true
      attribute :password, kind_of: String, required: true
      attribute :target, kind_of: String, required: true
      attribute :ssl_pem_file, kind_of: String
      attribute :ssl_verify, kind_of: String, default: 'mysql'

      include Rune::Helpers
    end
  end
end