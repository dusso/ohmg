Rails.application.routes.draw do
  devise_for :users  # Rota para o Devise

  root to: 'home#index'  # Página inicial será a listagem de produtos

  # Dashboard
  get 'dashboard', to: 'dashboard#show'

  # Account (usuário)
  resource :account, only: [:show, :edit, :update]

  # Ads (Anúncios)
  resources :ads, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      get 'review',          to: 'ads#review'
      put 'publish',         to: 'ads#publish'
      put 'deactivate',      to: 'ads#deactivate'
      post 'add_image',      to: 'ads#add_image'
      patch 'sort_images',   to: 'ads#sort_images'
      delete 'remove_image', to: 'ads#remove_image'
    end
  end

  # Products (Produtos)
  resources :products do
    collection do
      get :dynamic_fields
      get :load_subcategories
    end
  end

  # Categories (Categorias)
  resources :categorias, only: [:index] do
    member do
      get :subcategorias
    end
  end
  

  # Messages (Mensagens)
  resources :messages, only: [:index, :show, :new, :create, :destroy]

  # Bookmarks (Favoritos)
  resources :bookmarks, only: [:index, :create, :destroy]

  # Locations (NPA) - Ajuste para evitar conflitos
  resources :locations, only: [:index, :show]

  # Results (Resultados)
  resources :results, only: [:index]

  # Language - Alteração de idioma
  post 'change_locale', to: 'application#change_locale'

  # Páginas estáticas (Help, Rules, Terms, Conditions)
  get 'help',       to: 'pages#help'
  get 'rules',      to: 'pages#rules'
  get 'terms',      to: 'pages#terms'
  get 'conditions', to: 'pages#conditions'

  # Ajustando rotas de locations que eram conflitantes
  get '/locations/new',    to: 'locations#new', as: :new_location
  post '/locations',       to: 'locations#create', as: :create_location
  patch '/locations/:id',  to: 'locations#update', as: :update_location
  delete '/locations/:id', to: 'locations#destroy', as: :destroy_location
end
