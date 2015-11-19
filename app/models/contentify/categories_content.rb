module Contentify
  class CategoriesContent < ActiveRecord::Base
    establish_connection Contentify.config.data_source

    belongs_to :category
    belongs_to :content
  end
end
