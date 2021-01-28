require "rails_helper"

RSpec.describe NotificationComponent, type: :component do
  subject(:notification) { described_class.new(type: type, data: data) }

  let(:result) { render_inline(notification) }

  context "when given a bad type" do
    let(:type) { "bad type" }
    let(:data) { "data" }

    it "does not render" do
      expect(result.to_html).to be_empty
    end
  end

  context "when given nil data" do
    let(:type) { "success" }
    let(:data) { nil }

    it "does not render" do
      expect(result.to_html).to be_empty
    end
  end

  context "when given bad data" do
    let(:type) { "success" }
    let(:data) { 123 }

    it "does not render" do
      expect(result.to_html).to be_empty
    end
  end

  context "when type is success" do
    let(:type) { "success" }
    let(:data) { "Great work" }

    it "renders a beautiful success notification" do
      expect(result.css("button").count).to eq 1
      expect(result.css("svg").count).to eq 2
      expect(result.css("p").count).to eq 1
    end
  end

  context "when type is error" do
    let(:type) { "error" }
    let(:data) { "Great work" }

    it "renders a beautiful error notification" do
      expect(result.css("button").count).to eq 1
      expect(result.css("svg").count).to eq 2
      expect(result.css("p").count).to eq 1
      expect(result.css("li").count).to eq 0
    end
  end

  context "when type is notice" do
    let(:type) { "error" }
    let(:data) { "Great work" }

    it "renders a beautiful notice notification" do
      expect(result.css("button").count).to eq 1
      expect(result.css("svg").count).to eq 2
      expect(result.css("p").count).to eq 1
      expect(result.css("li").count).to eq 0
    end
  end

  context "when given a list" do
    let(:type) { "success" }
    let(:data) { {title: "Great work", list: ["a", "b"]} }

    it "renders a beautiful notice notification" do
      expect(result.css("button").count).to eq 1
      expect(result.css("svg").count).to eq 2
      expect(result.css("p").count).to eq 1
      expect(result.css("li").count).to eq 2
    end
  end
end
