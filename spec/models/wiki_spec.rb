require 'rails_helper'
require 'random_data'

RSpec.describe Wiki, type: :model do
  let(:name) { RandomData.random_sentence }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }

  let(:datetime) { "Thu, 03 Nov 2016 22:25:15 -0400" }
  let(:user) { User.create!(email: "user@bloccit.com", password: "password") }
  let(:wiki) { Wiki.create!(title: title, body: body, private: true, user: user) }

  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:user) }

  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_length_of(:body).is_at_least(20) }

  describe "attributes" do
    it "has title, body, private, user attributes" do
      expect(wiki).to have_attributes(title: title, body: body, private: true, user: user)
    end
  end
end
