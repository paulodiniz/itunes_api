ItunesApi::Application.routes.draw do

  resources :categories do
    member do
      get 'top/:monetization' => 'categories#top'
      get 'rank/:monetization' => 'categories#rank'
    end
  end
end
