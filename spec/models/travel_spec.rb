require 'rails_helper'

RSpec.describe Travel, type: :model do
  describe '旅程表のバリデーション' do
    let(:user) { FactoryBot.build(:user_test) }
    let(:travel) { FactoryBot.build(:travel, user_id: user.id) }

    context 'idが空欄でないこと' do
      it 'user_idが空欄でないこと' do
        travel.user_id = ''
        expect(travel).to be_invalid
      end
    end
      
    context '入力項目が空欄でないこと' do
      it 'titleが空欄でないこと' do
        travel.title = ''
        expect(travel).to be_invalid
      end
      it 'dateが空欄でないこと' do
        travel.date = ''
        expect(travel).to be_invalid
      end
    end
    
  end
  
  describe '旅程表のアソシエーション' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
            expect(Travel.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end

