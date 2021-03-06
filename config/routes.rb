Depot::Application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  scope '(:locale)' do
    resources :users
    resources :orders
    resources :carts
    resources :line_items do
      member do
        post 'decrement'
      end
    end
    resources :products do
      get :who_bought, on:  :member
    end

    root to: 'store#index', as: 'store'
  end
end
