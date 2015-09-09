Rails.application.routes.draw do

  namespace :api do
    resources :products, param: :alias_name, only: [:show, :index]
  end

  scope module: :public do
    root 'index#index'
    get '*path', :to => 'index#index'
  end

end
