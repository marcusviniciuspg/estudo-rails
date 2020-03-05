Rails.application.routes.draw do
  resources :levels, only: [:index] do
    resources :disciplines, only: [:index]
    collection do
      get 'tree'
    end
  end
end