Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end

  get '/tests/id/start', to: 'tests#start'

  #resources :questions

  #resources :tests do
  #  get :beginner, on: :collection

  #  member do
  #    post :start
  #  end
  #end

  #get '/tests', to: 'tests#index'

  #get '/tests/:id/start', to: 'tests#start'

  #get '/tests(/:id)', to: 'tests#show'

  #Spec::Matchers.create  do |meringue|
  #  match do |substance|
  #    substance.looks_like?(meringue)
  #  end
  #end

  #match '/tests/:id', to: 'tests#create', via: %i[post put]
end
