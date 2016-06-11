Rails.application.routes.draw do
  get "/" => "static_pages#index"
  get "/dashboard/:name" => "dashboard#index"
  resources :special_days, only: [:show, :index]
end
