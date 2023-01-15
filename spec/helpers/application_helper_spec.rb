require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:spot_name) { 'Spot Name' }
  let(:base_title) { 'Chottosokomade!!' }

  describe 'applicationヘルパー|full_titleメソッド 適切なタイトルが生成されることのテスト' do
    context '引数に文字列が存在する場合' do
      it '製品名とベースタイトル（Chottosokomade!!）が結合して表示される' do
        expect(full_title(spot_name)).to eq("#{spot_name} - #{base_title}")
      end
    end

    context '引数が空文字の場合' do
      it 'ベースタイトル（Chottosokomade!!）が表示される' do
        expect(full_title('')).to eq(base_title)
      end
    end

    context '引数がnilの場合' do
      it 'ベースタイトル（Chottosokomade!!）が表示される' do
        expect(full_title(nil)).to eq(base_title)
      end
    end
  end
end
