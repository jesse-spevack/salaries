# frozen_string_literal: true

class CleanButtonComponent < ViewComponent::Base
  def initialize(action:, text:)
    @action = {action: action}
    @text = text
  end
end
