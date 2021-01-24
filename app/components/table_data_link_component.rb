# frozen_string_literal: true

class TableDataLinkComponent < ViewComponent::Base
  def initialize(text:, path:, data: {})
    @text = text
    @path = path
    @data = data
  end
end
