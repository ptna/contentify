require_dependency "contentify/application_controller"

module Contentify
  class UserSessionsController < ApplicationController
    layout false

    skip_before_action :require_login

    def new
      @user = User.new
    end

    def create
      if @user = login(params[:email], params[:password])
        redirect_back_or_to(categories_path, notice: I18n.t('login.success'))
      else
        flash.now[:alert] = I18n.t('login.failed')
        render :new
      end
    end

    def destroy
      logout
      redirect_to(login_path, notice: I18n.t('logout.success'))
    end
  end
end
