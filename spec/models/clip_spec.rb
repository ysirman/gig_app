# frozen_string_literal: true

require "rails_helper"

RSpec.describe Clip, type: :model do
  it "is valid with a event_id and user_id" do
    clip = FactoryBot.build(:clip)
    expect(clip).to be_valid
  end

  it "is invalid without a event_id" do
    clip = FactoryBot.build(:clip, event_id: nil)
    clip.valid?
    expect(clip.errors[:event_id]).to include(I18n.t :"errors.messages.blank")
  end

  it "is invalid without a user_id" do
    clip = FactoryBot.build(:clip, user_id: nil)
    clip.valid?
    expect(clip.errors[:user_id]).to include(I18n.t :"errors.messages.blank")
  end
end
