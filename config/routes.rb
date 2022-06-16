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
get 'homes/about'

resources :orders,only: [:new,:index,:show,:create]do
  collection do
  post 'confirmation' => 'orders#confirmation', as: 'confirmation'
  get 'thank' => 'orders#thank', as: 'thank'
  end
  end
end

namespace :admin do
resources :orders, only: [:show, :index, :update]

resources :order_details, only: [:update]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end