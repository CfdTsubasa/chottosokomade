require 'rails_helper'

RSpec.describe 'マイページ画面', type: :request do
  describe 'マイページ画面リクエストテスト' do
    let(:user_01){create(:user_01)}
    let!(:spot_01){create(:spot,name: "公園A",comment: "とても広いです。", user: user_01)}

    before do
      sign_in user_01
      get user_show_path(user_01)
    end

    it 'マイページ画面が表示される' do
      expect(response).to have_http_status(200)
    end

    it 'マイページにユーザー名が表示される' do
      expect(response.body).to include "#{user_01.name}"
    end

    it 'マイページにユーザー名が表示される' do
      expect(response.body).to include "#{user_01.profile}"
    end

    it 'マイページに投稿したスポット名が表示される' do
      expect(response.body).to include "#{spot_01.name}"
    end

    it 'マイページに投稿したスポットのコメントが表示される' do
      expect(response.body).to include "#{spot_01.comment}"
    end

    it 'マイページにスポットの投稿者名が表示される' do
      expect(response.body).to include "#{user_01.name}"
    end
  end
end
