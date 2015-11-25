module Contentify
  class ApplicationController < ActionController::Base
    before_action :set_as_private!
    before_action :require_login

    private
    def set_as_private!
      response.headers['Cache-Control'] = 'no-cache, no-store'
    end

    def not_authenticated
      redirect_to login_path, alert: "ログインしてください。"
    end
  end
end
