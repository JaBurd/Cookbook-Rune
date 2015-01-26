#
# Cookbook Name:: rune
# Resource:: deploy
#
# Author:: Ian Henry (<ianjhenry00@gmail.com>)
#
# Copyright 2015
#
require 'chef/resource/lwrp_base'

actions :deploy, :nothing
default_action :deploy

attribute :artifact, kind_of: String, name_attribute: true, required: true
attribute :target, kind_of: String
attribute :endpoint, kind_of: String, required: true
attribute :repo, kind_of: String, required: true
attribute :filename, kind_of: String
