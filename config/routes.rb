Rails.application.routes.draw do
  devise_for :users
  resources :business_performances 
  root 'business_performances#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end  
end
