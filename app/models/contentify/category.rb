module Contentify
  class Category < ActiveRecord::Base
    extend ActiveHash::Associations::ActiveRecordExtensions

    establish_connection Contentify.config.data_source

    acts_as_tree

    has_many :categories_contents
    has_many :contents, through: :categories_contents

    belongs_to_active_hash :public_status

    accepts_nested_attributes_for :categories_contents, allow_destroy: true
  end
end
