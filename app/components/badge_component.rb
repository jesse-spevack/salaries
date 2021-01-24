# frozen_string_literal: true

class BadgeComponent < ViewComponent::Base
  def initialize(text:, color:)
    @text = text
    @color = "bg-#{color}-100"
  end
end
