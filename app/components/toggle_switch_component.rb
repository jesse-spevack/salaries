# frozen_string_literal: true

class ToggleSwitchComponent < ViewComponent::Base
  def initialize(form:, attribute:, options: {})
    @form = form
    @attribute = attribute
    @toggle_on_class = options[:toggle_on_class] || "bg-indigo-600"
    @toggle_off_class = options[:toggle_off_class] || "bg-gray-600"
    @toggle_translate_on_class = options[:toggle_translate_on_class] || "translate-x-5"
    @toggle_translate_off_class = options[:toggle_translate_off_class] || "translate-x-0"
    @toggle_invisible_class = options[:toggle_translate_off_class] || "invisible"
    @toggle_enabled_event_name_value = "#{kebab_attribute}-enabled-event"
    @toggle_disabled_event_name_value = "#{kebab_attribute}-disabled-event"
  end

  def kebab_attribute
    @attribute.to_s.gsub("_", "-")
  end
end
