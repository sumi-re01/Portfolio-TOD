require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーバリデーションのテスト' do
    let!(:user_test) { FactoryBot.build(:user_test) }

    it 'バリデーションが有効なこと' do
      expect(user_test).to be_valid
    end

    it 'メールアドレスが空欄でないこと' do
      user_test.email = ''
      expect(user_test).to be_invalid
    end

    context '名前のバリデーション' do
      it '名前が空欄でないこと' do
        user_test.name = ''
        expect(user_test).to be_invalid
      end
    end

    context 'パスワードのバリデーション' do
      it 'パスワードが5文字以下でないこと' do
        user_test.password = '12345'
        expect(user_test).to be_invalid
      end

      it 'パスワードが6文字以上であること' do
        user_test.password = '123456'
        expect(user_test).to be_valid
      end
    end

  end
end