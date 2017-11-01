Rails.application.routes.draw do
  # post 'comments/create',to: 'comments#create'
  #
  # delete 'comments/destroy',to: 'comments#destroy'
  resources :comments,only:[:create,:destroy]
  mount Rich::Engine => '/rich', :as => 'rich'
  resources :users do
      member do
          get 'crop',to: "users#crop"
          patch 'crop',to: "users#crop_update"
      end
  end
  resources :sessions,only:[:new,:create,:destroy]

  resources :items
  # get 'static_pages/home'
  # get 'crop',to: "users#crop"
  # post 'crop',to:"users#origin_avatar"

  # get 'users/crop',to: "users#crop"
  # get ''

  root to: 'static_pages#home'
  get 'signup',to: "users#new"

  get 'signin',to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
