Rails.application.routes.draw do
  get '/' => 'homepage#index'
  get '/dashboard/:name' => 'dashboard#index'
  get '/special_days' => 'special_days#index'
  get '/special_days/:id' => 'special_days#show'
  # get '/about' => 'static_pages#about'
end