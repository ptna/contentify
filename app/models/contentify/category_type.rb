module Contentify
  class CategoryType < ActiveYaml::Base
    set_root_path Contentify::Engine.root + "config/master"
    set_filename "category_type"

    include ActiveHash::Enum
    include ActiveHash::Associations

    enum_accessor :type
  end
end
