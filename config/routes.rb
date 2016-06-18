Rails.application.routes.draw do
  get '/' => 'homepage#index'
  get '/dashboard/:name' => 'dashboard#index'
end