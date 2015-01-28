module Rune
    module Helpers
      include Chef::DSL::IncludeRecipe

      # Installs Opscode's Artifactory Gem,
      # Called during rune_config.
      #
      def gem_install
        chef_gem 'artifactory' do
          action :install
        end
      end

      # Configures Artifactory Connection
      # configuration for API calls
      #
      # @param [String] endpoint
      #   The endpoint for the Artifactory server
      # @param [String] username
      # @param [String] password
      #   The basic authentication information. Since this uses HTTP
      #   Basic Auth, it is highly recommended that you run Artifactory
      #   over SSL.
      # @param [String] ssl_pem_file
      #   Specified path to a pem file with your custom
      #   certificates. Must be a valid Cert.
      # @param [String] ssl_verify
      #   for disabling ssl verification if you feelin cray cray
      #
      def set_rune_config
        Artifactory.configure do |config|
          config.endpoint = new_resource.endpoint
          config.username = new_resource.username
          config.password = new_resource.password
          config.ssl_pem_file = new_resource.ssl_pem_file
          config.ssl_verify = new_resource.ssl_verify
        end
      end

      # Deploys the artifact to a temporary directory by default, or
      # to a specific directory as long as specified.
      #
      # @param [String] target
      #   Pulls down the artifact to a target directory. If not specified
      #   artifact is delivered to a temporary directory.
      #
      def deploy_rune_artifact
        repo = Artifactory::Resource::Repository.find(name: @new_resource.repo)
        version = Artifactory::Resource::Artifact.latest_version(name: "#{ @new_resource.artifact }", group: "#{ @new_resource.artifact }",repo: "#{ repo }")
        artifact = Artifactory::Resource::Artifact.search(name: "#{ @new_resource.artifact }", repos: "#{ @new_resource.repo }", version: "#{ version }").first
        artifact.download(new_resource.target, filename: new_resource.filename )
      end

      def rune_artifact_upload
        repo = Artifactory::Resource::Repository.find(@new_resource.repo)
        artifact = Artifactory::Resource::Artifact.new(@new_resource.local_path)
        repo.upload(new_resource.local_path, new_resource.remote_path)
      end


      # Updates Artifactory connection configuration
      # for API calls with existing xml object
      #
      # @param [File] target
      #   the location of xml file descriptor to upload
      #
      def update_rune_config
        if client.exists?
          new_config = Artifactory::Client.new(endpoint: @new_resource.endpoint, username: @new_resource.username, password: @new_resource.password, ssl_pem_file: @new_resource.ssl_pem_file, ssl_verify: @new_resource.ssl_verify)
        else
          puts "client does not exist use set_rune_config"
        end
      end

      # Non functioning databag support. To be integrated after
      # common logical functions have been written.
      #
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

      # Method for defining a resource
      #
      # currently a placeholder. not yet in use.
      #
      #def load_current_resource
      #  sha = Digest::SHA1.hexdigest new_resource.location
      #  @extension = new_resource.location.match(/[:\.]([0-9a-z]+)$/i)[1]
      #  @file_name = "#{new_resource.name}-#{sha}.#{@extension}"
      #  @current_resource = Chef::Resource::ArtifactPackage.new(@new_resource.name)
      #  @current_resource
      #end

      # Method for uploading an artifact to
      # the artifactory server.
      # @param [String] repo
      #   the key of the repo where you wish to upload
      #   the artifact
      # @param [String] local_path
      #   the local path to the artifact you wish to upload
      # @param [String] remote_path
      #   the path where this resource will live in the remote
      #   artifactory repository
      # @param [String] properties
      #   a list of matrix properties... in case you're using them
      #

    end
  end
