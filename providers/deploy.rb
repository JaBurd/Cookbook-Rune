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

class Chef
  class Provider
    class RuneDeploy < Chef::Provider::LWRPBase
      include Rune::Helpers

      def whyrun_supported?
        true
      end

     action :deploy do
       converge_by("Deploy #{ @new_resource.artifact }") do
       # Deploy artifact from helpers.rb
         deploy_rune_artifact
       end
     end

    end
  end
end


