# frozen_string_literal: true

class SelectListItemComponent < ViewComponent::Base
  def initialize(value:, selected:, id: nil)
    @selected = selected
    @value = value
    @id = id
  end
end
