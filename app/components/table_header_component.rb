# frozen_string_literal: true

class TableHeaderComponent < ViewComponent::Base
  def initialize(text:)
    @text = text
  end
end
