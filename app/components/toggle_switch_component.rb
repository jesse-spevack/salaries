# frozen_string_literal: true

class ToggleSwitchComponent < ViewComponent::Base
  def initialize(form:, attribute:)
    @form = form
    @attribute = attribute
  end
end
