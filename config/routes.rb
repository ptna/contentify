Contentify::Engine.routes.draw do
  resources :categories, except: [:show]
  resources :users,      except: [:show]
  resources :contents
  resources :materials,  except: [:show]
  resources :user_sessions, only: [:create]
  get    'login',  to: 'user_sessions#new',     as: :login
  delete 'logout', to: 'user_sessions#destroy', as: :logout
end
