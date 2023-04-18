Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :business_performances 
  root 'business_performances#index'

  resources :teams do
    resources :assigns do
    end
  end
  
  
    


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end  
end
