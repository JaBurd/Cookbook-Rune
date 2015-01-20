#
# Cookbook Name:: Rune
# Provider:: deploy
#
# Author:: Ian Henry (<ianjhenry00@gmail.com>)
#
# Copyright 2015
#
require 'digest'
require 'pathname'
require 'yaml'
require 'chef/provider/lwrp_base'
require_relative 'helpers'
require 'artifactory'

class Chef
  class Provider
    class RuneConfig < Chef::Provider::LWRPBase
      include Artifactory::Resource
      include Rune::Helpers

      def whyrun_supported?
        true
      end

      action :config do
        converge_by("Configure #{ @new_resource.artifact }") do
          # Configure client xml from helpers.rb
          config_rune_deploy
        end

      action :update do
        converge_by("Updating #{ @new_resource.artifact }") do
          update_rune_config
        end
      end
    end
  end
end
