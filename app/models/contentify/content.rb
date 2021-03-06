module Contentify
  class Content < ActiveRecord::Base
    extend ActiveHash::Associations::ActiveRecordExtensions

    include Contentify::Concerns::DateTimeIntegratable

    has_many :categories_contents
    has_many :categories, through: :categories_contents

    belongs_to_active_hash :public_status, class_name: 'Contentify::PublicStatus'

    accepts_nested_attributes_for :categories_contents, allow_destroy: true

    integrate_datetime_fields :released_at, :closed_at

    mount_uploader :summary_image, FileUploader

    # validates
    validates :title,
              presence: true,
              length: { maximum: 255 }
    validates :summary, length: { maximum: 500 }
    validates :summary, length: { maximum: 100 }
    validates :author_name, length: { maximum: 50 }
    validates :body, presence: true
    validates :released_at, presence: true
  end
end
