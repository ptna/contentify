require_dependency "contentify/application_controller"

module Contentify
  class UsersController < ApplicationController
    include Concerns::BasicController::New
    include Concerns::BasicController::Create
    include Concerns::BasicController::Edit
    include Concerns::BasicController::Update
    include Concerns::BasicController::Destroy

    registrable_params_as    :registrable_params
    success_redirect_path_as :users_path
    fault_redirect_path_as   :users_path
    notice_attribute_as      :name

    def index
      @users = User.try(:page, params[:page])
    end

    def registrable_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
