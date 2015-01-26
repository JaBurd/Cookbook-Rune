#
# Cookbook Name:: rune
# Resource:: config
#
# Author:: Ian Henry (<ianjhenry00@gmail.com>)
#
# Copyright 2015
#
require 'chef/resource/lwrp_base'

actions :create, :update, :delete
default_action :create

attribute :endpoint, kind_of: String, name_attribute: true, required: true
attribute :username, kind_of: String, required: true
attribute :password, kind_of: String, required: true
attribute :ssl_pem_file, kind_of: String
attribute :ssl_verify, kind_of: [TrueClass, FalseClass], default: false
attribute :repo, kind_of: String, required: true

attr_accessor :exists
