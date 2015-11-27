module Contentify
  class Search::Content < Search::Base

    attr_accessor :title, :category_id

    def initialize(attributes = {})
      super attributes if attributes.present?
    end

    def matches
      results = Contentify::Content
        .joins(:category)
        .includes(:category)
        .references(:category)
        .where { category.id == my { category_id } }
      results = results.where { title.like my { "%#{title}%" } } if title.present?
      results = results.where { released_at >= my { released_at_from.to_time.try(:beginning_of_day) } } if released_at_from.present?
      results = results.where { released_at <= my { released_at_to.to_time.try(:end_of_day) } } if released_at_to.present?
      results = results.where(top: true) if top.present? && top != "0"
      results = results.where(business_top: true) if business_top.present? && business_top != "0"
      results
    end
  end
end
