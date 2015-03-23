Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    resources :replies
  end

  devise_for :users
end
