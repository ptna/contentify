require 'rails/generators/base'

module Contentify
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a Contentify initializer to your application."

      def copy_initializer
        template "contentify.rb", "config/initializers/contentify.rb"
      end
    end
  end
end
