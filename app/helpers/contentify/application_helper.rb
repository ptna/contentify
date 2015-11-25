module Contentify
  module ApplicationHelper
    def lf2br(text)
      html_escape(text).gsub(/\r\n|\r|\n/, '<br />').html_safe
    end

    def space2br(text)
      html_escape(text).gsub(' ', '&nbsp;').html_safe
    end

    def display_error(obj, attribute)
      if has_error?(obj, attribute)
        content_tag(:div, obj.errors.full_messages_for(attribute.to_sym).first, { style: 'color: #F44336;' })
      end
    end

    def has_error?(obj, attribute)
      obj.errors.full_messages_for(attribute.to_sym).present?
    end

    def materialized_form_field(f, field_type, field_name, options = { class: '', choices: [] })
      if f.object.present? && has_error?(f.object, field_name)
        if options[:class].present?
          options[:class] << ' invalid'
        else
          options[:class] = 'invalid'
        end
      elsif f.object.present? && f.object.method(field_name).call().present?
        if options[:class].present?
          options[:class] << ' valid'
        else
          options[:class] = 'valid'
        end
      end
      if field_type == :select
        choices = options.delete(:choices)
        f.method(field_type).call(field_name, choices, { include_blank: true }, options)
      else
        f.method(field_type).call(field_name, options)
      end
    end
  end
end
