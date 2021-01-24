# frozen_string_literal: true

class TextFieldComponent < ViewComponent::Base
  def initialize(form:, attribute:, data: {})
    @form = form
    @attribute = attribute
    @data = data
  end
end
