require_dependency "contentify/application_controller"

module Contentify
  class ContentsController < ApplicationController
    include Contentify::Concerns::BasicController::New
    include Contentify::Concerns::BasicController::Create
    include Contentify::Concerns::BasicController::Edit
    include Contentify::Concerns::BasicController::Update
    include Contentify::Concerns::BasicController::Destroy

    before_action :setup_editable_content!, only: [:edit, :update, :destroy]

    registrable_params_as    :registerable_params
    success_redirect_path_as :contents_path
    fault_redirect_path_as   :contents_path
    notice_attribute_as      :title

    def index
      @contents = Content.all.try(:page, params[:page])
    end

    ## use preview
    def show
    end

    private
    def registerable_params
      params.require(:content).permit(
        :public_status_id,
        :priority,
        :title,
        :summary,
        :summary_image,
        :summary_image_caption,
        :body,
        :author_name,
        :is_display_author,
        :released_at_date,
        :released_at_hour,
        :released_at_minute,
        :closed_at_date,
        :closed_at_hour,
        :closed_at_minute,
        category_ids: []
      )
    end

    def setup_editable_content!
      @content = Content.find(params[:id])
    end
  end
end
