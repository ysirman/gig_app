# frozen_string_literal: true

require "rails_helper"

RSpec.describe FollowRelation, type: :model do
  it "is valid with a follower_id and followed_id" do
    follow_relation = FactoryBot.build(:follow_relation)
    expect(follow_relation).to be_valid
  end

  it "is invalid without a follower_id" do
    follow_relation = FactoryBot.build(:follow_relation, follower_id: nil)
    follow_relation.valid?
    expect(follow_relation.errors[:follower_id]).to include(I18n.t :"errors.messages.blank")
  end

  it "is invalid without a followed_id" do
    follow_relation = FactoryBot.build(:follow_relation, followed_id: nil)
    follow_relation.valid?
    expect(follow_relation.errors[:followed_id]).to include(I18n.t :"errors.messages.blank")
  end
end
