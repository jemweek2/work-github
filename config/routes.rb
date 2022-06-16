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
get '/homes/about' => 'homes#about'
resources :products, only: [:index, :show]
end

namespace :admin do
resources :products, only: [:index, :show, :new, :edit, :update, :create]
resources :genres, only: [:index, :create, :edit, :update]
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
