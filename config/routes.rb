Rails.application.routes.draw do
  devise_for :users
  
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  
  # Defines the root path route ("/")
  # root "articles#index"
  

 authenticated :user do
    root 'recipes#index', as: :authenticated_root
  end

  root 'users#index'

  resources :recipes do
     member do
      delete :destroy
      patch :toggle_recipe_public
      get 'add_ingredient', to: 'recipes#add_ingredient'
      post 'add_ingredient', to: 'recipes#add_ingredient'
      get 'generate_shopping_list', to: 'recipes#generate_shopping_list'
      delete 'remove_food'
    end
    
    collection do
      get 'public_recipes', to: 'recipes#public_recipes'
    end
  end
end
