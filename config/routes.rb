Rails.application.routes.draw do


  namespace :admin do
    root to: 'homes#top'
   resources :orders, only: [:show, :update]
   resources :order_details, only: [:update]
   
   resources :customers, only: [:index, :show, :edit, :update]
   resources :items, only: [:new, :index, :create, :show, :edit, :update]

  end
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
