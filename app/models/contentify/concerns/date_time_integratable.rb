module Contentify
  module Concern
    module DateTimeIntegratable
      extend ActiveSupport::Concern

      included do
        after_initialize :initialize_integrate_datetime
        before_validation :integrate_datetime

        def initialize_integrate_datetime
          self.class.datetime_integrate_targets.each do |attribute|
            next unless self.respond_to?("#{attribute}")
            original_date = self.send("#{attribute}")
            next if original_date.nil?
            unless self.send("#{attribute}_date").present?
              self.send("#{attribute}_date=", original_date.strftime("%Y-%m-%d"))
            end
            unless self.send("#{attribute}_hour").present?
              self.send("#{attribute}_hour=", original_date.strftime("%H"))
            end
            unless self.send("#{attribute}_minute").present?
              self.send("#{attribute}_minute=", original_date.strftime("%M"))
            end
          end
        end

        def integrate_datetime
          self.class.datetime_integrate_targets.each do |attribute|
            date = self.send("#{attribute}_date")
            hour = self.send("#{attribute}_hour")
            minute = self.send("#{attribute}_minute")
            if date.present? && hour.present? && minute.present?
              self.send("#{attribute}=", Time.zone.parse("#{date} #{hour}:#{minute}:00"))
            else
              self.send("#{attribute}=", nil)
            end
          end
        rescue
          nil
        end
      end

      module ClassMethods
        attr_accessor :datetime_integrate_targets

        def integrate_datetime_fields(*attributes)
          self.datetime_integrate_targets = attributes
          attributes.each do |attribute|
            self.send(:attr_accessor, "#{attribute}_date")
            self.send(:attr_accessor, "#{attribute}_hour")
            self.send(:attr_accessor, "#{attribute}_minute")
          end
        end
      end
    end
  end
end
