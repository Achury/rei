Integrador::Application.routes.draw do
  resources :sessions
  resource :dashboard
  resources :courses
  resources :homework
  resources :resources
  resources :messages
  
  root :to => "dashboards#show"
end
