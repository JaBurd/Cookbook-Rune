require 'chef/resource/lwrp_base'

#class Chef
#  class Resource
#    class RuneDeploy < Chef::Resource::LWRPBase
#      self.resource_name = :rune_deploy
      actions :deploy, :delete, :nothing
      default_action :deploy

      attribute :artifact, kind_of: String, name_attribute: true, required: true
      attribute :target, kind_of: String
      attribute :endpoint, kind_of: String, required: true
      attribute :repo, kind_of: String, required: true
      attribute :filename, kind_of: String

#      include Rune::Helpers

#    end
#  end
#end
