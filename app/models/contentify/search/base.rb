module Contentify
  class Search::Base
    include ActiveModel::Model
    include ActiveModel::Validations::Callbacks
  end
end
