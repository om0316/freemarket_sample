Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  resources :users, only: [:show] do
    member do
      get "likes", "listings", "in_progress", "completed", "purchase", "purchased"
    end
  end
  
  resources :items, only: [:new, :create, :show] do
    member do
      post "purchase"
    end
    collection do
      get "search"
    end
  end

  resources :signup do
    collection do
      get 'sns'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5' 
      get 'done' # 登録完了後のページ
    end
  end
end
