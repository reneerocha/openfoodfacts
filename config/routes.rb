Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs' unless Rails.env.test?
  mount Rswag::Api::Engine => '/api-docs' unless Rails.env.test?
  resources :products, only: %i[index show]
  get 'home/index'
  root 'home#index'
end
