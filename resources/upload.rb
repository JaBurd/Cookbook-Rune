#
# Cookbook Name:: rune
# Resource:: upload
#
# Author:: Ian Henry (<ianjhenry00@gmail.com>)
#
# Copyright 2015
#
require 'chef/resource/lwrp_base'

actions :upload
default_action :upload

attribute :item, kind_of: String,  name_attribute: true, required: true
attribute :repo, kind_of: String, required: true
attribute :remote_path, kind_of: String, required: true
attribute :local_path, kind_of: Array, required: true
attribute :properties, kind_of: String, default: nil
