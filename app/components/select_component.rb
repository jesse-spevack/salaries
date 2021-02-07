# frozen_string_literal: true

class SelectComponent < ViewComponent::Base
  def initialize(title:, select_text:, collection:)
    @collection = collection
    @select_text = select_text || "Select #{title.humanize}"
  end
end
