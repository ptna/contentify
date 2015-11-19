module Contentify
  class Content < ActiveRecord::Base
    establish_connection Contentify.config.data_source

    has_many :categories_contents
    has_many :categories, through: :categories_contents
  end
end
