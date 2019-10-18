# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event, type: :model do
  it "is valid with a title, gig_date, target_join_num, region, user_id and genre" do
    event = FactoryBot.build(:event)
    expect(event).to be_valid
  end

  it "is invalid without a title" do
    event = FactoryBot.build(:event, title: nil)
    event.valid?
    expect(event.errors[:title]).to include(I18n.t :"errors.messages.blank")
  end

  it "is invalid without a gig_date" do
    event = FactoryBot.build(:event, gig_date: nil)
    event.valid?
    expect(event.errors[:gig_date]).to include(I18n.t :"errors.messages.blank")
  end

  it "is invalid without a target_join_num" do
    event = FactoryBot.build(:event, target_join_num: nil)
    event.valid?
    expect(event.errors[:target_join_num]).to include(I18n.t :"errors.messages.blank")
  end

  it "is invalid without a target_price" do
    event = FactoryBot.build(:event, target_price: nil)
    event.valid?
    expect(event.errors[:target_price]).to include(I18n.t :"errors.messages.blank")
  end

  it "is invalid without a region" do
    event = FactoryBot.build(:event, region: nil)
    event.valid?
    expect(event.errors[:region]).to include(I18n.t :"errors.messages.blank")
  end

  it "is invalid without a genre" do
    event = FactoryBot.build(:event, genre: nil)
    event.valid?
    expect(event.errors[:genre]).to include(I18n.t :"errors.messages.blank")
  end

  it "is invalid without a user_id" do
    event = FactoryBot.build(:event, user_id: nil)
    event.valid?
    expect(event.errors[:user]).to include(I18n.t :"errors.messages.blank")
  end
end
