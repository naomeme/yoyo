SampleBbs::Application.routes.draw do
  resources :topics, path: '/'

  root to: 'topics#index'
end
