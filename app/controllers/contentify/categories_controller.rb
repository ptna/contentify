require_dependency "contentify/application_controller"

module Contentify
  class CategoriesController < ApplicationController
    include Concerns::BasicController::New
    include Concerns::BasicController::Create
    include Concerns::BasicController::Edit
    include Concerns::BasicController::Update
    include Concerns::BasicController::Destroy

    registrable_params_as    :registerable_params
    success_redirect_path_as :categories_path
    fault_redirect_path_as   :categories_path
    notice_attribute_as      :name

    def index
      @categories = Contentify::Category.display_tree
    end

    def registerable_params
      params.require(:category).permit(
        :parent_id,
        :priority,
        :public_status_id,
        :name,
        :slug,
        :direct_url,
        :image,
        :is_visible
      )
    end
  end
end
