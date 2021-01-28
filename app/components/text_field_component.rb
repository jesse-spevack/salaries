# frozen_string_literal: true

class TextFieldComponent < ViewComponent::Base
  def initialize(form:, attribute:, placeholder: nil, data: {})
    @attribute = attribute
    @data = data
    @form = form
    @placeholder = placeholder
  end
end
