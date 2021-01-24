# frozen_string_literal: true

class BlankTableHeaderComponent < ViewComponent::Base
  def initialize(text:)
    @text = text
  end
end
