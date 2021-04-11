Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts do
    resources :comments, shallow: true, only: %i[new create destroy]
  end
end
