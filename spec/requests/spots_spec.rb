require 'rails_helper'

RSpec.describe '最新投稿一覧画面', type: :request do
  describe '最新投稿一覧画面リクエストテスト' do
    let(:user_01){create(:user_01)}
    let!(:spot_01){create(:spot,name: "公園A",comment: "とても広いです。", user: user_01)}

    before do
      sign_in user_01
      get spots_path
    end

    it '最新投稿一覧画面が表示される' do
      expect(response).to have_http_status(200)
    end

    it '見出しが表示される' do
      expect(response.body).to include "最新投稿一覧"
    end

    it '一覧にスポット名が表示される' do
      expect(response.body).to include "#{spot_01.name}"
    end

    it '一覧にスポットのコメントが表示される' do
      expect(response.body).to include "#{spot_01.comment}"
    end

    it '一覧にスポットの投稿者名が表示される' do
      expect(response.body).to include "#{user_01.name}"
    end
  end
end
