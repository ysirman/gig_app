# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment, type: :model do
  it "is valid with a description, event_id and user_id" do
    event = FactoryBot.build(:comment)
    expect(event).to be_valid
  end

  it "is invalid without a description" do
    comment = FactoryBot.build(:comment, description: nil)
    comment.valid?
    expect(comment.errors[:description]).to include(I18n.t :"errors.messages.blank")
  end

  it "is invalid without a event_id" do
    comment = FactoryBot.build(:comment, event_id: nil)
    comment.valid?
    expect(comment.errors[:event_id]).to include(I18n.t :"errors.messages.blank")
  end

  it "is invalid without a user_id" do
    comment = FactoryBot.build(:comment, user_id: nil)
    comment.valid?
    expect(comment.errors[:user_id]).to include(I18n.t :"errors.messages.blank")
  end
end
