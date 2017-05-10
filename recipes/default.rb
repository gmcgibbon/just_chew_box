#
# Cookbook Name:: just_chew
# Recipe:: default
#
# Copyleft (Ↄ) 2017 Gannon McGibbon
#
# All rights reserved - Please Redistribute
#

include_recipe 'apt'
include_recipe 'vim'
include_recipe 'phantomjs2'
include_recipe 'imagemagick'
include_recipe 'nodejs'
include_recipe 'ruby_build'
include_recipe 'ruby_rbenv::user'
include_recipe 'postgresql::server'
include_recipe 'postgresql::client'
