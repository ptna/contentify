require "active_support/configurable"

module Contentify
  class Config
    include ActiveSupport::Configurable
    # define accessor and default value
    config_accessor :data_source

    configure do |config|
      config.data_source = :default
    end
  end
end