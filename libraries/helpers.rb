class Chef
    module Rune
      module Helpers
        require 'artifactory'
        include Artifactory::Resource
        require_relative 'helpers'

        # Deploys the artifact to a temporary directory by default, or
        # to a specific directory as long as specified.
        #
        # @param [String] target
        # Pulls down the artifact to a target directory. If not specified
        # artifact is delivered to a temporary directory.

        def deploy_rune_artifact
          artifact = new_resource.artifact.search(name: "#{ @new_resource.artifact }").first
          artifact.download(new_resource.target)
        end

      # The following method is a placeholder. Once the requirement of
      # a full installation of the gem is required. Which, is very likely

      def gem_binary
        if File.exists?("/opt/chef/embedded/bin/gem")
          "/opt/chef/embedded/bin/gem"
        elsif
          File.exists?("/opt/sensu/embedded/bin/gem")
          "/opt/sensu/embedded/bin/gem"
        else
          "gem"
        end
      end

      # Non functioning databag support. To be integrated after
      # common logical functions have been written.

      def data_bag_item(item, missing_ok=false)
        raw_hash = Chef::DataBagItem.load("artifactory", item)
        encrypted = raw_hash.detect do |key, value|
          if value.is_a?(Hash)
            value.has_key?("encrypted_data")
          end
        end
        if encrypted
          secret = Chef::EncryptedDataBagItem.load_secret
          Chef::EncryptedDataBagItem.new(raw_hash, secret)
        else
          raw_hash
        end
      rescue Chef::Exceptions::ValidationFailed,
          Chef::Exceptions::InvalidDataBagPath,
          Net::HTTPServerException => error
        missing_ok ? nil : raise(error)
      end

    end
  end
end