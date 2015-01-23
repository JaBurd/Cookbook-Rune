#require 'chef/resource/lwrp_base'

#class Chef
#  class Resource
#    class RuneConfig < ::Chef::Resource::LWRPBase
#      self.resource_name = :rune_config
      actions :create, :update, :delete
      default_action :create

      attribute :endpoint, kind_of: String, name_attribute: true, required: true
      attribute :username, kind_of: String, required: true
      attribute :password, kind_of: String, required: true
      attribute :ssl_pem_file, kind_of: String
      attribute :ssl_verify, kind_of: [TrueClass, FalseClass], default: false
      attribute :repo, kind_of: String, required: true

#      include Rune::Helpers
      attr_accessor :exists
#    end
#  end
#end