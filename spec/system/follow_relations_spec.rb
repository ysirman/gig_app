# frozen_string_literal: true

require "rails_helper"

RSpec.feature "FollowRelations", type: :system do
  background(:each) do
    @user = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:user, :other_user)
    login_as @user, scope: :user
  end

  scenario "can be created by user", js: true do
    visit root_path
    expect {
      within(".userList") do
        find(".follow-relation > a").click
      end
      expect(page).to have_content "フォローしました"
    }.to change { FollowRelation.count }.by(1)
  end

  scenario "of followed can be shown" do
    follow_relation = FactoryBot.create(:follow_relation, follower_id: @user.id, followed_id: @other_user.id)
    visit user_path(@user.id)
    click_on "1フォロー中"
    expect(page).to have_content follow_relation.followed.name
  end

  scenario "of follower can be shown" do
    follow_relation = FactoryBot.create(:follow_relation, follower_id: @other_user.id, followed_id: @user.id)
    visit user_path(@user.id)
    click_on "1フォロワー"
    expect(page).to have_content follow_relation.follower.name
  end

  scenario "of followed can be deleted by owner", js: true do
    follow_relation = FactoryBot.create(:follow_relation, follower_id: @user.id, followed_id: @other_user.id)
    visit root_path
    expect {
      within(".userList") do
        find(".follow-relation > a").click
      end
      expect(page).to have_content "フォロー解除しました"
    }.to change { FollowRelation.count }.by(-1)
  end
end
