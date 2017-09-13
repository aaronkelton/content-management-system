Rails.application.routes.draw do

  # ROOT Route
  # match '/', to: 'demo#index', via: :get #longhand MATCH-y form
  root to: 'demo#index' # shorter sans MATCH
  # root 'demo#index' # super-short-y

  ### RESOURCE ROUTES ###
  resources :subjects do
    member do
      get :delete
    end
  end
  resources :pages do
    member do
      get :delete
    end
  end
  resources :sections do
    member do
      get :delete
    end
  end
  ### END RESOURCE ROUTES ###

  ##### GENERATED ROUTES #####
  # get 'subjects/index'
  # get 'subjects/show'
  # get 'subjects/new'
  # get 'subjects/edit'
  # get 'subjects/delete'
  ### END GENERATED ROUTES ###

  # SIMPLE MATCH Route
  # get 'demo/index' # shorthand version
  match 'demo/index', to: 'demo#index', via: :get # longhand version

  # Match the url {{ site.url }}/demo/hello to the demo controller, hello method
  match 'demo/hello', to: 'demo#hello', via: :get

  # SIMPLE Route for matching demo#other_hello
  match 'demo/other_hello', to: 'demo#other_hello', via: :get

  # SIMPLE Route for matching demo#lynda
  match 'demo/lynda', to: 'demo#lynda', via: :get

  # DEFAULT Route, parens indicate optional
  # may be deprecated in future Rails versions
  # get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
