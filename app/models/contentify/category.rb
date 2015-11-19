module Contentify
  class Category < ActiveRecord::Base
    establish_connection Contentify.config.data_source
  end
end
