# frozen_string_literal: true

class TableBoldDataComponent < ViewComponent::Base
  def initialize(text:)
    @text = text
  end
end
