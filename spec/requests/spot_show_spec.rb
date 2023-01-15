require 'rails_helper'

RSpec.describe 'スポット画面', type: :request do
  describe 'スポット詳細画面リクエストテスト' do
    let(:user_01){create(:user_01)}
    let!(:spot_01){create(:spot,name: "公園A",comment: "とても広いです。",address: "千代田区", user: user_01)}

    before do
      sign_in user_01
      get spot_path(spot_01)
    end

    it 'スポット詳細画面が表示される' do
      expect(response).to have_http_status(200)
    end

    it 'スポット詳細画面にスポット名が表示される' do
      expect(response.body).to include "#{spot_01.name}"
    end

    it 'スポット詳細画面にスポットのコメントが表示される' do
      expect(response.body).to include "#{spot_01.comment}"
    end

    it 'スポット詳細画面にスポットの住所が表示される' do
      expect(response.body).to include "#{spot_01.address}"
    end

    it 'スポット詳細画面にスポットの投稿者名が表示される' do
      expect(response.body).to include "#{user_01.name}"
    end
  end
end
