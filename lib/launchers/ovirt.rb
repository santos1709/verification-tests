#!/usr/bin/env ruby
#require 'ovirtsdk4'

require 'common'
require 'host'
require 'launchers/cloud_helper'

module BushSlicer

  class Ovirt
    include Common::Helper
    include Common::CloudHelper

    attr_reader :config

    def initialize(**opts)
      @can_terminate = true
      service_name = opts.delete(:service_name)
      if service_name
        @config = conf[:services, service_name]
      else
        @config ||= :OVIRT
      end

      config_opts = opts.delete(:config)
      if config_opts
        deep_merge!(@config, config_opts)
      end
    end
  end
end
