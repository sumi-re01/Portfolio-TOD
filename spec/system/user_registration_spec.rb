require 'rails_helper'

RSpec.describe "ユーザー登録", type: :system do
  let(:user) { create(:user_test) }
  
  context 'トップページ' do
    it '新規登録画面が表示されること' do
      visit root_path
      click_link 'FIRST VISIT'
      expect(current_path).to eq new_user_registration_path
    end
    
    it '投稿一覧が表示されること' do
      visit root_path
      click_link 'GALLERY'
      expect(current_path).to eq galleries_path
    end
  end

  context '新規登録' do
    it 'マイページに遷移' do
      visit new_user_registration_path
    #   find('div', text: /\A▽▽▽\z/).click
      click_link 'FIRST VISIT'
      visit '/users/sign_up'
      fill_in 'ニックネーム', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      find('.form__btn').click
      expect(current_path).to eq user_path(user)
    end
  end
  
  
end