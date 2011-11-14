Integrador::Application.routes.draw do
  resources :sessions
  resource :dashboard
  resources :courses
  resources :students do
    collection do
      get :search
    end
  end
  
  root :to => "dashboards#show"
end
