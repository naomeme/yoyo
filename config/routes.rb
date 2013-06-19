SampleBbs::Application.routes.draw do
  resources :topics, path: '/' do
    resources :comments
  end

  root to: 'topics#index'
end
