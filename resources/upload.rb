#
# Cookbook Name:: artifactory
# Resource:: package
#
# Author:: Ian Henry (<ianjhenry00@gmail.com>)
#
# Copyright 2015

actions :upload

default_action :upload

attribute :artifact, kind_of: String, required: true, name_attribute: true
attribute :repo, kind_of: String, required: true
attribute :remote_path, kind_of: String, required: true
attribute :local_path, kind_of: String
attribute :properties, kind_of: Hash
