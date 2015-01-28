#
# Cookbook Name:: rune
# Resource:: deploy
#
# Author:: Ian Henry (<ianjhenry00@gmail.com>)
#
# Copyright 2015
#
require 'chef/resource/lwrp_base'

actions :deploy, :upload, :delete, :nothing
default_action :deploy

attribute :artifact, kind_of: String, name_attribute: true, required: true
attribute :target, kind_of: String
attribute :endpoint, kind_of: String, required: true
attribute :repo, kind_of: String, required: true
attribute :filename, kind_of: String, default: nil
attribute :username, kind_of: String, required: true
attribute :password, kind_of: String, required: true
attribute :ssl_pem_file, kind_of: String
attribute :ssl_verify, kind_of: [TrueClass, FalseClass], default: false
attribute :repo, kind_of: String, required: true
