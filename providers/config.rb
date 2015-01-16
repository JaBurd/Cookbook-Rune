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

include Artifactory::Resource
actions :configure, :nothing

  action :config do
    config_rune_deploy
  end