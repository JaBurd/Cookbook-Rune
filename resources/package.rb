#
# Cookbook Name:: rune
# Resource:: package
#
# Author:: Ian Henry (<ianjhenry00@gmail.com>)
#
# Copyright 2015
#
require 'chef/resource/lwrp_base'

actions :install
default_action :install

attribute :name, kind_of: String, required: true, name_attribute: true
attribute :endpoint, kind_of: String
attribute :checksum, kind_of: String
attribute :owner, kind_of: String, regex: Chef::Config[:user_valid_regex], default: 'root'
attribute :group, kind_of: String, regex: Chef::Config[:user_valid_regex], default: 'root'
attribute :file_name, kind_of: String, required: true