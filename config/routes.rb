Rails.application.routes.draw do

  namespace :api do
    resources :products, param: :alias_name, only: [:show, :index]
  end

end
