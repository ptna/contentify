module Contentify
  class Category < ActiveRecord::Base
    establish_connection Contentify.config.data_source

    has_many :categories_contents
    has_many :contents, through: :categories_contents

    acts_as_tree
  end
end
