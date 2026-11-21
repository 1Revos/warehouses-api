Rails.application.routes.draw do
  get "/shop_products/", to: "shop_products#index"
  post "/shop_products/create", to: "shop_products#create"
  patch "/shop_products/:id", to: "shop_products#update"
  delete "/shop_products/:id", to: "shop_products#destroy"

  get "/warehouse_products", to: "warehouse_products#index"
  post "/warehouse_products/create", to: "warehouse_products#create"
  patch "/warehouses_products/:id", to: "warehouse_products#update"
  delete "/warehouses_products/:id", to: "warehouse_products#destroy"

  get "/warehouses", to: "warehouses#index"
  get "/warehouses/:id", to: "warehouses#show"
  post "/warehouses/create", to: "warehouses#create"
  patch "/warehouses/:id", to: "warehouses#update"
  delete "/warehouses/:id", to: "warehouses#destroy"

  get "/products", to: "products#index"
  get "/products/:id", to: "products#show"
  post "/product/crate", to: "products#create"
  patch "/product/:id", to: "products#update"
  delete "/product/:id", to: "products#destroy"

  get "/shops/:id", to: "shops#show"
  get "/shops", to: "shops#index"
  patch "/shops/:id", to: "shops#update"
  post "/shops/create", to: "shops#create"
  delete "/shops/:id", to: "shops#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
