Contentify::Engine.routes.draw do
  resources :categories, except: [:show]
end
