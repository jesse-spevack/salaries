# frozen_string_literal: true

class TableDataComponent < ViewComponent::Base
  def initialize(text:)
    @text = text
  end
end
