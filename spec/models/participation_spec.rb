# frozen_string_literal: true

require "rails_helper"

RSpec.describe Participation, type: :model do
  it "is valid with a event_id, user_id and fixed" do
    participation = FactoryBot.build(:participation)
    expect(participation).to be_valid
  end

  it "is invalid without a event_id" do
    participation = FactoryBot.build(:participation, event_id: nil)
    participation.valid?
    expect(participation.errors[:event_id]).to include(I18n.t :"errors.messages.blank")
  end

  it "is invalid without a user_id" do
    participation = FactoryBot.build(:participation, user_id: nil)
    participation.valid?
    expect(participation.errors[:user_id]).to include(I18n.t :"errors.messages.blank")
  end
end
