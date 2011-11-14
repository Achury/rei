Api::Application.routes.draw do
  namespace :ulises do
    resource :schedule
  end
end
