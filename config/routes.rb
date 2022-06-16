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
get "customers/show" => "customers#show"
get "customers/confirm" => "customers#confirm"
patch "customers/withdraw" => "customers#withdraw"
resources :customers, only: [:edit, :update]
resources :carts, only: [:index, :update, :update, :destroy, :create]

end




namespace :admin do

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
