require "contentify/engine"
require "contentify/config"

module Contentify
  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield config if block_given?
  end
end
