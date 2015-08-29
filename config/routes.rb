ItunesApi::Application.routes.draw do

  resources :categories do
    member do
      get ':monetization/top' => 'categories#top'
      get ':monetization/rank/:rank' => 'categories#rank'
    end
  end
end
