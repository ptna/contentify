class ParentNotSelfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.id == value
      record.errors[attribute] << (options[:message] || "Invalid parent id")
    end
  end
end
