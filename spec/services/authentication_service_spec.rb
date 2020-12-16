require "rails_helper"

RSpec.describe AuthenticationService do
  subject { described_class.new(auth_hash) }

  let(:slack_id) { "raw_slack_id_123" }
  let(:hashed_slack_id) { Digest::SHA256.hexdigest(slack_id) }
  let(:auth_hash) { instance_double "Omniauth Hash" }
  let(:auth_info_hash) { instance_double "Omniauth Hash" }

  before do
    # Mock omniauth hash behavior
    # slack_id = request.env["omniauth.auth"].info.user_id
    # "my_slack_id_12345"
    allow(auth_hash).to receive(:info).and_return(auth_info_hash)
    allow(auth_info_hash).to receive(:user_id).and_return(slack_id)
  end

  describe "#find_or_create_user" do
    context "when user exists" do
      let!(:user) { create(:user, slack_id: hashed_slack_id) }

      it "returns user" do
        expect(subject.find_or_create_user).to eq user
      end
    end

    context "when user does not exist" do
      it "creates user" do
        expect { subject.find_or_create_user }.to change { User.count }.from(0).to(1)
      end
    end
  end
end
