Rails.application.routes.draw do

  resources :songs, only: [:index, :show, :edit, :new, :create, :edit, :update, :destroy]
end
