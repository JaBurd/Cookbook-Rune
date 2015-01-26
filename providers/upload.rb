#
# Cookbook Name:: Rune
# Provider:: config
#
# Author:: Ian Henry (<ianjhenry00@gmail.com>)
#
# Copyright 2015
#
require_relative '../libraries/helpers'
include Rune::Helpers

  def whyrun_supported?
    true
  end

  action :upload do
    converge_by("Upload #{ @new_resource.artifact }") do
      # Upload artifact from helpers.rb
      rune_artifact_upload
    end
  end