# frozen_string_literal: true

class SelectListItemComponent < ViewComponent::Base
  def initialize(value:, selected:)
    @selected = selected
    @value = value
  end
end
