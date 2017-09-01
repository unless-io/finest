Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'  }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/preview', to: 'lists#preview'
  post '/search', to: 'lists#search'


  resource :list, only: [:show], path: ':username' do
    resources :items, except: [:index]
  end

end
