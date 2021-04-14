Rails.application.routes.draw do
  root to: 'homes#top'

    devise_scope :user do
      post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    end

    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
    # 新規登録画面のリロード時のエラー防止
    get '/users', to: redirect("/users/sign_up")

    resources :users, only: [:show, :edit, :update]
    resources :galleries, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
      resources :marks, only: [:create, :destroy]
    end

    patch 'travels/travel/:id/sort', to: 'travels#sort'
    resources :travels, only: [:index, :create, :show, :destroy] do
      resources :travel_plans, only: [:create, :update, :destroy]
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
