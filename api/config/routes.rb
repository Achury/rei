Api::Application.routes.draw do
  namespace :ulises do
    resource :schedule
    resources :grades
  end
  
  namespace :ei do
    resources :homework
  end
end
