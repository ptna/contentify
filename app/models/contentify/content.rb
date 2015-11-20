module Contentify
  class Content < ActiveRecord::Base
    extend ActiveHash::Associations::ActiveRecordExtensions

    include Concern::DateTimeIntegratable

    establish_connection Contentify.config.data_source

    has_many :categories_contents
    has_many :categories, through: :categories_contents

    belongs_to_active_hash :public_status

    accepts_nested_attributes_for :categories_contents, allow_destroy: true

    integrate_datetime_fields :released_at, :closed_at
  end
end
