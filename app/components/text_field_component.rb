# frozen_string_literal: true

class TextFieldComponent < ViewComponent::Base
  def initialize(form:, attribute:, placeholder: nil, validations_enabled: false, data: {})
    @attribute = attribute
    @data = data
    @form = form
    @placeholder = placeholder
    @validations_enabled = validations_enabled
  end
end
