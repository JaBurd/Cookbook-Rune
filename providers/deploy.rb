#
# Cookbook Name:: Rune
# Provider:: deploy
#
# Author:: Ian Henry (<ianjhenry00@gmail.com>)
#
# Copyright 2015
#
begin
  require 'artifactory'
rescue LoadError => e
  Chef::Log.warn("Dependency 'gem' not loaded: #{e}")
end

require 'chef/provider/lwrp_base'
require_relative '../libraries/helpers'
include Rune::Helpers
include Chef::DSL::IncludeRecipe


  def whyrun_supported?
    true
  end

  action :deploy do
    converge_by("Deploy #{ @new_resource.artifact }") do
      # Configure XML and deploy artifact
      log "Installing Required Gem"
      gem_install
      log "Configuring endpoint"
      set_rune_config
      log "Deploying artifact"
      deploy_rune_artifact
    end
  end

  action :upload do
    converge_by("Upload #{ @new_resource.item }") do
      # Upload artifact from helpers.rb
    log "Uploading artifact"
    rune_artifact_upload
    end
  end

  action :delete do
    converge_by("Delete #{ @new_resource.artifact}") do
      # Delete artifact in artifactory from helpers.rb
      delete_rune_artifact
    end
  end



