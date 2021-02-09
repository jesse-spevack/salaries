# frozen_string_literal: true

class SearchListComponent < ViewComponent::Base
  def initialize(form:, title:, item:, collection:)
    @collection = collection
    @form = form
    @item = item
    @title = title
  end
end
