module Contentify
  class User < ActiveRecord::Base
    authenticates_with_sorcery!

    attr_accessor :password_confirmation

    mount_uploader :image, FileUploader

    validates :password, length: { minimum: 12 }
    validates :password, confirmation: true
    validates :password_confirmation, presence: true
    validates :email, uniqueness: true
  end
end
