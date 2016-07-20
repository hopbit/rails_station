Rails.application.routes.draw do
  get '/' => 'homepage#index'
  get '/dashboard/:name' => 'dashboard#index'
  resources :special_days
  # get '/about' => 'static_pages#about'
end