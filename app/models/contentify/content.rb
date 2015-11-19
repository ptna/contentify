module Contentify
  class Content < ActiveRecord::Base
    establish_connection Contentify.config.data_source

    belongs_to :category
  end
end
