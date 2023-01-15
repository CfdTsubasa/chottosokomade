require 'rails_helper'

RSpec.feature "フォローしているユーザーのスポット画面", type: :feature do
  feature 'フォローしているユーザーのスポット画面テスト' do
    given(:user_01){create(:user_01)}
    given(:user_02){create(:user_02)}
    given!(:spot_01){create(:spot_01,user: user_02)}

    before do
      sign_in user_01
      user_01.follow(user_02)
      visit spots_following_users_spots_path
    end

    scenario 'フォローしているユーザーのスポット名が表示されていること' do
      expect(page).to have_content spot_01.name
    end

    scenario 'フォローしているユーザーのスポット名が表示されていること' do
      expect(page).to have_content spot_01.comment
    end

    scenario 'フォローしているユーザーのスポットのタグが表示されていること' do
      spot_01.tag_list.each do |tag|
        expect(page).to have_content tag
      end
    end

    scenario '投稿したユーザー名が表示されていること' do
      expect(page).to have_content spot_01.user.name
    end
  end
end
