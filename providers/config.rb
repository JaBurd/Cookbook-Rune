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

#require 'artifactory'
#class Chef
#  class Provider
#    class RuneConfig < ::Chef::Provider::LWRPBase
      include Rune::Helpers
#      include Artifactory::Resource

      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :create do
        converge_by("Configure #{ @new_resource.endpoint }") do
          # Configure client xml from helpers.rb
          gem_install
#          include Artifactory::Resource
          set_rune_config
        end
      end

      action :update do
        converge_by("Updating #{ @new_resource.artifact }") do
          update_rune_config
        end
      end
#    end
#  end
#end