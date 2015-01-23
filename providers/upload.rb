#
# Cookbook Name:: Rune
# Provider:: deploy
#
# Author:: Ian Henry (<ianjhenry00@gmail.com>)
#
# Copyright 2015
#
require 'chef/provider/lwrp_base'
require_relative '../libraries/helpers'

#class Chef
#  class Provider
#    class RuneUpload < Chef::Provider::LWRPBase
      include Rune::Helpers

      def whyrun_supported?
        true
      end

      action :upload do
        converge_by("Upload #{ @new_resource.artifact }") do
          # Upload artifact from helpers.rb
          upload_rune_artifact
        end
      end