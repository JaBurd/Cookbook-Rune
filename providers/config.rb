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
      gem_install
  # configure artifactory configuration xml from helpers.rb
      set_rune_config
    end
  end

  action :update do
    converge_by("Updating #{ @new_resource.artifact }") do
      update_rune_config
    end
  end
