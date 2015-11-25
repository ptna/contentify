module Contentify
  class Category < ActiveRecord::Base
    extend ActiveHash::Associations::ActiveRecordExtensions

    attr_accessor :display_name

    has_closure_tree order: :priority, dependent: :nullify

    has_many :categories_contents
    has_many :contents, through: :categories_contents

    belongs_to_active_hash :public_status, class_name: 'Contentify::PublicStatus'

    accepts_nested_attributes_for :categories_contents, allow_destroy: true

    mount_uploader :image, FileUploader

    validates :priority, presence: true

    def self.display_tree
      self.hash_tree_to_array(self.hash_tree)
    end

    private
    def self.hash_tree_to_array(hash, depth = "|--")
      tree = []
      hash.each do |k, v|
        k.display_name = "#{depth}#{k.name}"
        tree << k
        if v.present?
          case v
          when ActiveSupport::OrderedHash
            tree += self.hash_tree_to_array(v, depth.gsub('|--', '|  ') << "|--")
          end
        end
      end
      tree
    end
  end
end
