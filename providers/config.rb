#
# Cookbook Name:: Rune
# Provider:: config
#
# Author:: Ian Henry (<ianjhenry00@gmail.com>)
#
# Copyright 2015
#
require 'chef/provider/lwrp_base'
require_relative '../libraries/helpers'
include Rune::Helpers

use_inline_resources if defined?(use_inline_resources)

  def whyrun_supported?
    true
  end

  action :create do
    converge_by("Configure #{ @new_resource.endpoint }") do
  # install artifactory gem on node from helpers.rb
      log "Installing gem"
      g = chef_gem 'artifactory' do
        action :nothing
      end
      g.run_action(:install)
  # configure artifactory configuration xml from helpers.rb
      log "Configuring endpoint"
      set_rune_config
    end
  end

  action :update do
    converge_by("Updating #{ @new_resource.artifact }") do
      update_rune_config
    end
  end

def create_app_key
  redis = ::Redis.new
  redis.set "#{@new_resource.app_name}", "#{@new_resource.api_key}"
end