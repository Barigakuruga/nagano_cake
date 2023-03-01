Rails.application.routes.draw do


  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }



    scope module: :public do
      root to: 'homes#top'
    get 'my_page' => 'customers#show'
    get 'about' => 'homes#about'
    get 'information' => 'customers#edit'
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdraw' => 'customers#withdraw', as: 'withdraw'
    resources :homes, only: [:top, :about]
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :unsubscribe, :update, :withdraw]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :thanx, :index, :show, :confirm, :create,]
  end

  namespace :admin do
    root to: 'homes#top'
   resources :orders, only: [:show, :update]
   resources :order_details, only: [:update]

   resources :customers, only: [:index, :show, :edit, :update]
   resources :items, only: [:new, :index, :create, :show, :edit, :update]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
