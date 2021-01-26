class TestComponentPreview < ViewComponent::Preview
  def with_default_title
    data = {
      title: "Hello World!",
      list: ["First thing", "Second thing"]
    }
    render(NotificationComponent.new(type: "success", data: data))
  end

  def with_long_title
    # render(TestComponent.new(title: "This is a really long title to see how the component renders this"))
  end

  def with_content_block
  #   render(TestComponent.new(title: "This component accepts a block of content")) do
  #     tag.div do
  #       content_tag(:span, "Hello")
  #     end
  #   end
  end
end