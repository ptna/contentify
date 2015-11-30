require_dependency "contentify/application_controller"

module Contentify
  class MaterialsController < ApplicationController
    include Contentify::Concerns::BasicController::Index
    include Contentify::Concerns::BasicController::New
    include Contentify::Concerns::BasicController::Create
    include Contentify::Concerns::BasicController::Edit
    include Contentify::Concerns::BasicController::Update
    include Contentify::Concerns::BasicController::Destroy

    before_action :setup_editable_material!, only: [:edit, :update, :destroy]

    registrable_params_as    :registrable_params
    success_redirect_path_as :contents_path
    fault_redirect_path_as   :contents_path
    notice_attribute_as      :title

    private
    def registrable_params
      params.require(:material).permit(:title, :source)
    end

    def setup_editable_material!
      @content = Material.find(params[:id])
    end
  end
end
