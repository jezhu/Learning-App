Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  
  post '/search', to: 'doogle#search'
  root 'doogle#home'
end
