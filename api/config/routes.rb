Api::Application.routes.draw do
  namespace :ulises do
    resource :schedule
    resources :grades
  end
end
