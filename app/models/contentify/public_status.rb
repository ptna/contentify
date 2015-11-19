module Contentify
  class PublicStatus < ActiveYaml::Base
    set_root_path Contentify::Engine.root + "config/master"
    set_filename "public_status"

    include ActiveHash::Enum
    include ActiveHash::Associations

    enum_accessor :type

    has_many :articles
    has_many :categories

    class << self
      def display_assoc
        all.map do |m| [m.name, m.id] end
      end
    end
  end
end
