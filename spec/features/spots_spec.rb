require 'rails_helper'

RSpec.feature "スポット詳細画面", type: :feature do
  feature 'スポット詳細画面テスト' do
    given(:user_01){create(:user_01)}
    given!(:spot){create(:spot,name: "公園A",comment: "とても広いです。",address: "千代田区",tag_list: ["東京","渋谷区","公園"], user: user_01)}

    background do
      sign_in user_01
      visit spot_path(spot)
    end

    scenario 'タイトルが動的になっていること' do
      expect(page).to have_title "#{spot.name} - Chottosokomade!!"
    end

    scenario 'スポット名が表示されていること' do
      expect(page).to have_content spot.name
    end

    scenario 'スポットの住所が表示されていること' do
      expect(page).to have_content spot.address
    end

    scenario 'スポットのタグが表示されていること' do
      spot.tag_list.each do |tag|
        expect(page).to have_content tag
      end
    end

    scenario '投稿したユーザー名が表示されていること' do
      expect(page).to have_content spot.user.name
    end

    scenario '投稿したユーザー名をクリックした際にユーザー画面に遷移すること' do
      click_on user_01.name
      expect(page).to have_current_path user_show_path(user_01)
    end

    scenario 'タグをクリックした際に検索画面に遷移すること' do
      click_on spot.tag_list[0]
      expect(page).to have_current_path searches_search_path(tags: spot.tag_list[0])
    end
  end
end
