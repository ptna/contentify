module Contentify
  class CategoriesContent < ActiveRecord::Base
    belongs_to :category
    belongs_to :content
  end
end
