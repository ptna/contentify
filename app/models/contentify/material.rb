module Contentify
  class Material < ActiveRecord::Base
    mount_uploader :source, FileUploader

    validates :source,
              presence: true

    validates :title,
              presence: true
  end
end
