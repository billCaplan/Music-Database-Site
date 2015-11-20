Rails.application.routes.draw do
resources :users, only: [:create, :new, :show]

resource :session, only: [:create, :new, :destroy]

resources :bands, only: [:index] do
  resources :albums, only: [:new]
end

resources :bands, only: [:create, :new, :edit, :show, :update, :destroy]

resources :albums, only: [:create,:edit, :show, :update, :destroy]

resources :albums, only: [:index] do
  resources :tracks, only: [:new]
end

resources :tracks, only: [:create,:edit, :show, :update, :destroy]


end
