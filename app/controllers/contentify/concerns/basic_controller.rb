module Contentify
  module Concerns
    # give the basic controll method
    module BasicController

      module Base
        extend ActiveSupport::Concern

        included do
          def models_name
            self.send(:params)[:controller].split("/").last
          end

          def model_name
            self.send(:params)[:controller].camelize.singularize
          end
        end

        module ClassMethods
          attr_accessor :registrable_params,
                        :success_redirect_path,
                        :fault_redirect_path,
                        :notice_attribute

          def registrable_params_as(method_name)
            self.registrable_params = method_name
          end

          def success_redirect_path_as(path)
            self.success_redirect_path = path
          end

          def fault_redirect_path_as(path)
            self.fault_redirect_path = path
          end

          def notice_attribute_as(attribute_name)
            self.notice_attribute = attribute_name
          end
        end
      end

      module Index
        extend ActiveSupport::Concern

        include BasicController::Base

        included do
          def index
            self.instance_variable_set(
              "@#{models_name.downcase}", model_name.constantize.all.try(:page, 1))
          end
        end
      end

      module New
        extend ActiveSupport::Concern

        include BasicController::Base

        included do
          def new
            self.instance_variable_set(
              "@#{models_name.singularize}", model_name.constantize.new)
          end
        end
      end

      module Create
        extend ActiveSupport::Concern

        include BasicController::Base

        included do
          def create
            model = model_name.constantize.new(
              self.send(self.class.registrable_params))
            if model.save
              redirect_to(
                self.send(self.class.success_redirect_path),
                # TODO use given message.
                notice: model.send(self.class.notice_attribute) << "を作成しました。")
            else
              render :new
            end
          end
        end
      end

      module Edit
        extend ActiveSupport::Concern

        include BasicController::Base

        included do
          def edit
            model = model_name.constantize.find(params[:id])
            self.instance_variable_set("@#{models_name.singularize}", model)
          end
        end
      end

      module Update
        extend ActiveSupport::Concern

        include BasicController::Base

        included do
          def update
            model = model_name.constantize.find(params[:id])
            model.assign_attributes(self.send(self.class.registrable_params))
            if model.save
              redirect_to(
                self.send(self.class.success_redirect_path),
                notice: model.send(self.class.notice_attribute) << "を作成しました。")
            else
              render :edit
            end
          end
        end
      end

      module Destroy
        extend ActiveSupport::Concern

        include BasicController::Base

        included do
          def destroy
            model = model_name.constantize.find(params[:id])
            if model.destroy
              redirect_to(
                self.send(self.class.success_redirect_path),
                notice: model.send(self.class.notice_attribute) << "を削除しました。")
            else
              redirect_to(
                self.send(self.class.success_redirect_path),
                notice: model.send(self.class.notice_attribute) << "の削除に失敗しました。")
            end
          end
        end
      end

    end
  end
end
