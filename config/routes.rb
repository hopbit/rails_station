Rails.application.routes.draw do
  get '/' => 'homepage#index'
  get '/dashboard/:name' => 'dashboard#index'
  get '/special_days' => 'special_days#index'
  # get '/about' => 'static_pages#about'
end