Rails.application.routes.draw do

  namespace :admin do

    resources :customers, only: [:index, :new, :show, :edit, :create, :update]

    resources :items, only: [:index, :new, :show, :edit, :create, :update]
    
    resources :orders, only: [:new, :index, :show]
  end

  scope module: :public do
  
  
    root to: 'homes#top'

    get 'homes/about'

    resources :addresses, only:[:index, :edit, :show, :update, :destroy]

    get "/orders/complete" => "orders#complete"
    resources :orders, only: [:new, :confirm, :complere, :create,:index, :show]
    post "/orders/confirm" => "orders#confirm"
    

    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete "/cart_item_destroy_all" => "cart_items#destroy_all", as: "destroy_all"

    resources :items, only: [:index, :show,]

    resources :customers, only: [:index, :new, :show, :edit, :create, :update]
    

    get "customers/show" => "customers#show", as: "my_page"

  end

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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
