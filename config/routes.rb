Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  
  resources :users, only: [:show] do
    member do
      get "likes", "listings", "in_progress", "completed", "purchase", "purchased"
    end
  end
  
  resources :items, only: [:new, :create, :show] do
    member do
      post "purchase"
    end
  end

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5' 
      get 'done' # 登録完了後のページ
    end
  end
end
