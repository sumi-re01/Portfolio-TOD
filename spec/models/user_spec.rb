require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーのバリデーション' do
    let(:user) { FactoryBot.build(:user_test) }

    it 'バリデーションが有効なこと' do
      expect(user).to be_valid
    end

    context '名前のバリデーション' do
      it '名前が空欄でないこと' do
        user.name = ''
        expect(user).to be_invalid
      end
    end
    
    context 'メールアドレスのバリデーション' do
      it 'メールアドレスが空欄でないこと' do
        user.email = ''
        expect(user).to be_invalid
      end
      
      it 'メールアドレスに@が入っていないといけない' do
        user.email = 'xxxexample.com'
        expect(user).to be_invalid
      end
    end

    context 'パスワードのバリデーション' do
      it 'パスワードが5文字以下でないこと' do
        user.password = '12345'
        expect(user).to be_invalid
      end

      it 'パスワードが6文字以上であること' do
        user.password = '123456'
        expect(user).to be_valid
      end
    end

  end
end