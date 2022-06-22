Rails.application.routes.draw do



# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

scope module: :public do
root to: 'homes#top'
get "/about" => "homes#about", as: 'about'

get "customers" => "customers#show"
get "customers/confirm" => "customers#confirm", as: 'confirm'
get "customers/mypage/edit" => "customers#edit"
patch "customers/withdraw" => "customers#withdraw"
patch "customers/update" => "customers#update"

resources :addresses, only: [:index, :create, :edit, :destroy, :update]

resources :cart_items, only: [:index, :update, :destroy, :create]do
  collection do
    delete :destroy_all
  end
end

get 'confirmation' => 'orders#confirmation', as: 'confirmation'
resources :orders,only: [:new,:index,:show,:create]do
collection do
post 'confirmation' => 'orders#confirmation', as: 'confirmation'
get 'thank' => 'orders#thank', as: 'thank'
end
end
resources :products, only: [:index, :show]
end


namespace :admin do
devise_scope :admin do
    root "sessions#new"
end
resources :customers, only: [:index, :show, :update, :edit]
resources :orders, only: [:show, :index, :update]
resources :order_details, only: [:update]
resources :products, only: [:index, :show, :new, :edit, :update, :create]
resources :genres, only: [:index, :create, :edit, :update]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end