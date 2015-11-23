require_dependency "contentify/application_controller"

module Contentify
  class CategoriesController < ApplicationController
    include Concerns::BasicController::Index
    include Concerns::BasicController::New
    include Concerns::BasicController::Create
    include Concerns::BasicController::Edit
    include Concerns::BasicController::Update
    include Concerns::BasicController::Destroy
  end

  def registerable_params
    params.require(category).permit(
      :parent_id,
      :priority,
      :public_status_id,
      :name_jp,
      :name_en,
      :direct_url,
      :is_visible)
  end
end
